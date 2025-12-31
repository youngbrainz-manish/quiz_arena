import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/core/api/api_services.dart';
import 'package:quiz_app/core/api/dio_api_request.dart';
import 'package:quiz_app/core/models/category_model.dart';

class HomeController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    String url = DioApiSeArvices.category;
    try {
      isLoading.value = true;
      error.value = '';

      var response = await DioApiRequest().getCommonApiCall(url);
      if (response?.data?['status'] == "success") {
        categories.addAll((response?.data?['data'] as List).map((e) => CategoryModel.fromJson(e)).toList());
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
