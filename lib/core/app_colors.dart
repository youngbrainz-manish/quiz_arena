// import 'package:flutter/material.dart';

// class AppColors {
//   Color primaryColor = const Color.fromARGB(255, 54, 152, 244);
//   Color appBgColor = Color.fromARGB(255, 230, 239, 248);
//   Color cardColor = const Color.fromARGB(255, 54, 152, 244);
//   Color appBarTextColor = Colors.white;
//   Color textCololor = Colors.black;
//   Color buttonColor = const Color.fromARGB(255, 54, 152, 244);
//   Color buttonTextColor = Colors.white;
//   Color loaderColor = Colors.red;
//   Color hintColor = Colors.grey;
//   Color whiteColor = Colors.white;
//   Color blackColor = Colors.black;
//   Color borderColor = Colors.grey;
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  Color get primaryColor => Get.theme.colorScheme.primary;

  Color get appBgColor => Get.theme.scaffoldBackgroundColor;

  Color get cardColor => Get.theme.cardColor;

  Color get appBarTextColor => Get.theme.appBarTheme.foregroundColor ?? Colors.white;

  Color get textCololor => Get.theme.colorScheme.onSurface;

  Color get buttonColor => Get.theme.colorScheme.primary;

  Color get buttonTextColor => Get.theme.colorScheme.onPrimary;

  Color get loaderColor => Get.theme.progressIndicatorTheme.color ?? Colors.red;

  Color get hintColor => Get.theme.hintColor;

  Color get whiteColor => Colors.white;

  Color get blackColor => Colors.black;

  Color get borderColor => Get.theme.dividerColor;
}
