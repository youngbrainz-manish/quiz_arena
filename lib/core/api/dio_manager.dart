import 'package:dio/dio.dart';
import 'package:quiz_app/core/api/api_services.dart';

class DioApiManager {
  static final DioApiManager _singleton = DioApiManager._internal();

  Dio? dio;
  static String token = '';

  factory DioApiManager() {
    return _singleton;
  }

  DioApiManager._internal();

  Future<void> configureDio() async {
    BaseOptions options = BaseOptions(
      baseUrl: DioApiSeArvices.baseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 40000),
    );

    dio = Dio(options);

    dio?.interceptors.addAll({LogInterceptor(request: true, responseBody: true, error: true, requestBody: true)});

    dio?.httpClientAdapter = HttpClientAdapter();
  }

  Future<Dio> getDio() async {
    if (dio == null) {
      await configureDio();
    }
    return dio!;
  }

  static void setToken(String newToken) {
    token = newToken;
  }

  String getToken() {
    return token;
  }
}
