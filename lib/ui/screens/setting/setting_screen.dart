import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/theme/theme_controller.dart';
import 'package:quiz_app/core/translation/translation_keys.dart';
import 'setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Screen", style: TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24),
            Text(
              "Quiz Arena",
              style: TextStyle().copyWith(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 24),
            Obx(() {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        (settingController.selectedLanguage['code'] ?? ''),
                        style: TextStyle().copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                      ),
                    ),
                  ),
                  title: Text(TranslationKeys.changeLanguage.tr, style: TextStyle().copyWith(fontSize: 18)),
                  trailing: _languageDropdown(),
                  subtitle: _selectedLanguageText(),
                ),
              );
            }),

            Obx(() {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        themeController.isDark.value == true ? Icons.dark_mode : Icons.sunny,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  title: Text(TranslationKeys.changeTheme.tr, style: TextStyle().copyWith(fontSize: 18)),
                  trailing: Switch(
                    value: themeController.isDark.value,
                    onChanged: (value) {
                      themeController.toggleTheme();
                    },
                  ),
                  subtitle: Text(
                    themeController.isDark.value == true ? 'Dark Theme' : "Light Theme",
                    style: TextStyle().copyWith(fontSize: 12),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _languageDropdown() {
    return Obx(() {
      return DropdownButton<String>(
        underline: SizedBox(),
        icon: Icon(Icons.change_circle),
        value: controller.selectedLanguageCode.value,
        items: controller.languageList.map((lang) {
          return DropdownMenuItem<String>(value: lang['code'], child: Text(lang['name']!));
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            controller.changeLanguage(value);
          }
        },
      );
    });
  }

  Widget _selectedLanguageText() {
    return Obx(() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${TranslationKeys.selected.tr} ${TranslationKeys.language.tr}",
            style: TextStyle().copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          Text(
            " ${controller.selectedLanguage['name']}",
            style: TextStyle().copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }
}
