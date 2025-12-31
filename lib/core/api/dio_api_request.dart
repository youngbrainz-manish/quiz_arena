import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dioImported; // ignore: library_prefixes
import 'package:flutter/foundation.dart';
import 'package:quiz_app/core/api/dio_manager.dart';

class DioApiRequest {
  DioApiRequest();

  Future<dioImported.Response?> getCommonApiCall(
    String url, {
    bool? showToast,
    Map<String, dynamic>? queryParams,
  }) async {
    var dio = await DioApiManager().getDio();
    try {
      Options options = Options();

      options.headers = {'Accept-Language': "em"};

      var response = await dio.get(url, options: options, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      if (kDebugMode) print("object Dio Exception => $e");
      return null;
    } catch (ex) {
      if (kDebugMode) print("object Exception => $ex");
      return null;
    }
  }
}
