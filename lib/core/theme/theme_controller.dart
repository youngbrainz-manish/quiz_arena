import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();

  final isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = _box.read('isDark') ?? false;
  }

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark.value = !isDark.value;
    _box.write('isDark', isDark.value);
  }
}
