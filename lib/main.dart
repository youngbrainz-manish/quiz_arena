import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/theme_controller.dart';
import 'package:quiz_app/core/translation/message.dart';
import 'package:quiz_app/core/unknown_route_page.dart';
import 'package:quiz_app/ui/dashboard/dashboard_screen.dart';
import 'package:quiz_app/ui/screens/home/home_screen.dart';
import 'package:quiz_app/ui/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/ui/screens/setting/setting_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: Get.find<ThemeController>().themeMode.value, // ✅ controlled here
        themeMode: Get.find<ThemeController>().themeMode, // ✅ controlled here
        unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => DashboardScreen()),
          GetPage(name: '/homeScreenRoute', page: () => HomeScreen()),
          GetPage(name: '/settingScreenRoute', page: () => SettingScreen()),
          GetPage(name: '/quizScreenRoute', page: () => QuizScreen()),
        ],
        translations: Messages(),
        locale: Locale(GetStorage().read('language_code') ?? 'en'),
        fallbackLocale: const Locale('en'),
      );
    });
  }
}
