import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/translation/translation_keys.dart';
import 'package:quiz_app/ui/screens/home/home_controller.dart';
import 'package:quiz_app/ui/widgets/common_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationKeys.quizCategory.tr, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(child: _buildBody(context: context)),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CommonWidget().defaultLoader());
        }

        if (homeController.error.isNotEmpty) {
          return Text(homeController.error.value);
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: homeController.categories.length,
          itemBuilder: (context, index) {
            final item = homeController.categories[index];
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/quizScreenRoute", arguments: item);
                },
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(
                      item.id,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${item.count} Questions",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, height: 1.4),
                    ),
                    trailing: CircleAvatar(child: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                ),
              ),
            );
          },
        );
        // return GridView.builder(
        //   padding: const EdgeInsets.all(12),
        //   itemCount: homeController.categories.length,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 12,
        //     mainAxisSpacing: 12,
        //     childAspectRatio: 1.4,
        //   ),
        //   itemBuilder: (context, index) {
        //     final item = homeController.categories[index];
        //     return GestureDetector(
        //       onTap: () {
        //         Get.toNamed("/quizScreenRoute", arguments: item);
        //       },
        //       child: Card(
        //         child: Padding(
        //           padding: const EdgeInsets.all(12),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 item.id,
        //                 textAlign: TextAlign.center,
        //                 style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        //               ),
        //               const SizedBox(height: 8),
        //               Text(
        //                 "${item.count} Questions",
        //                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // );
      }),
    );
  }
}
