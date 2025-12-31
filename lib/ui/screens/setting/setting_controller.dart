import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final GetStorage _box = GetStorage();

  final RxList<Map<String, String>> languageList = <Map<String, String>>[
    {"code": "hi", "name": "हिन्दी"},
    {"code": "en", "name": "English"},
    {"code": "gu", "name": "ગુજરાતી"},
  ].obs;

  final RxString selectedLanguageCode = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() {
    final savedCode = _box.read<String>('language_code');

    if (savedCode != null && languageList.any((lang) => lang['code'] == savedCode)) {
      selectedLanguageCode.value = savedCode;
      Get.updateLocale(Locale(savedCode));
    }
  }

  Map<String, String> get selectedLanguage =>
      languageList.firstWhere((lang) => lang['code'] == selectedLanguageCode.value, orElse: () => languageList.first);

  void changeLanguage(String code) {
    if (selectedLanguageCode.value == code) return;

    selectedLanguageCode.value = code;
    _box.write('language_code', code);
    Get.updateLocale(Locale(code));
  }
}
