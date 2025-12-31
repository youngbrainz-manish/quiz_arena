import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/models/question_model.dart';
import 'package:quiz_app/ui/screens/quiz/quiz_controller.dart';
import 'package:quiz_app/ui/widgets/common_buttons.dart';
import 'package:quiz_app/ui/widgets/common_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            children: [
              Text(
                quizController.item.value?.id ?? "Quiz Screen",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "Total: ${quizController.questions.length.toString()}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          RxList<QuestionModel> questions = quizController.questions;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Level-: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton<String>(
                            icon: Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                            underline: SizedBox(),
                            value: quizController.selectedDifficulty.value,
                            items: quizController.difficulty.map((level) {
                              return DropdownMenuItem<String>(
                                value: level,
                                child: Text(
                                  level.capitalizeFirst!,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                quizController.selectedDifficulty.value = value;
                                quizController.getQuizData(id: quizController.item.value?.id ?? '');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                if (quizController.isLoading.value == true) ...[
                  Center(child: CommonWidget().defaultLoader()),
                ] else if (quizController.item.value == null || quizController.questions.isEmpty) ...[
                  Center(child: Text('No Question Available! in ${quizController.selectedDifficulty} Level')),
                ] else ...[
                  // Question text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${quizController.currentIndex.value + 1}.",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          questions[quizController.currentIndex.value].question,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Options
                  ...List.generate(questions[quizController.currentIndex.value].options.length, (index) {
                    final option = questions[quizController.currentIndex.value].options[index];
                    Color? color;

                    if (quizController.showAnswer.value) {
                      if (index == questions[quizController.currentIndex.value].correctIndex) {
                        color = Colors.green;
                      } else if (quizController.selectedOption.value == index &&
                          quizController.selectedOption.value !=
                              questions[quizController.currentIndex.value].correctIndex) {
                        color = Colors.red;
                      }
                    }

                    return optionsWidget(
                      index: index,
                      color: color,
                      option: option,
                      question: questions[quizController.currentIndex.value],
                    );
                  }),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: quizController.currentIndex.value != 0,
                        child: CommonButtons().textButton(title: "Previous", onTap: quizController.previousQuestion),
                      ),
                      SizedBox(width: 4),
                      Visibility(
                        visible: quizController.questions.length != quizController.currentIndex.value + 1,
                        child: CommonButtons().textButton(title: "Next", onTap: quizController.nextQuestion),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget optionsWidget({required int index, Color? color, required String option, required QuestionModel question}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: quizController.showAnswer.value
            ? null
            : () {
                quizController.answered.value = quizController.answered.value + 1;
                if (index == question.correctIndex) {
                  quizController.score.value = quizController.score.value + 1;
                }
                quizController.selectOption(index);
              },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(option, style: TextStyle(fontSize: 16, fontWeight: color == null ? null : FontWeight.bold)),
        ),
      ),
    );
  }
}
