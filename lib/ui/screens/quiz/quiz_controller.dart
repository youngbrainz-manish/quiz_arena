import 'dart:developer';
import 'package:get/get.dart';
import 'package:quiz_app/core/api/api_services.dart';
import 'package:quiz_app/core/api/dio_api_request.dart';
import 'package:quiz_app/core/app_constants.dart';
import 'package:quiz_app/core/models/category_model.dart';
import 'package:quiz_app/core/models/question_model.dart';

class QuizController extends GetxController {
  Rxn<CategoryModel> item = Rxn<CategoryModel>();
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxList<QuestionModel> questions = <QuestionModel>[].obs;

  final RxList<String> difficulty = <String>[
    AppConstants().difficultyEasy,
    AppConstants().difficultyMedium,
    AppConstants().difficultyHard,
  ].obs;

  var currentIndex = 0.obs;
  var selectedOption = (-1).obs;
  var showAnswer = false.obs;
  RxInt score = 0.obs;
  RxInt answered = 0.obs;

  RxString selectedDifficulty = AppConstants().difficultyEasy.obs;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments as CategoryModel?;
    item.value = arg;
    getQuizData(id: item.value?.id ?? '');
  }

  Future<void> getQuizData({required String id}) async {
    score = 0.obs;
    answered = 0.obs;
    currentIndex = 0.obs;
    selectedOption = (-1).obs;
    showAnswer = false.obs;
    isLoading.value = true;
    String url = DioApiSeArvices.quiz;

    try {
      var response = await DioApiRequest().getCommonApiCall(
        url,
        queryParams: {
          "categorySlug": id.toLowerCase().replaceAll(" ", "-"),
          "difficulty": selectedDifficulty.toLowerCase(),
        },
      );
      log("Quiz response => ${response?.data}");
      questions.clear();
      if (response?.data['status'] == "success") {
        questions.assignAll((response?.data['questions'] as List).map((q) => QuestionModel.fromJson(q)).toList());
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void selectOption(int index) {
    selectedOption.value = index;
    showAnswer.value = true;
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedOption.value = -1;
      showAnswer.value = false;
    }
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      selectedOption.value = -1;
      showAnswer.value = false;
    }
  }
}
