import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/screens/chat_module/users/users_screen.dart';
import 'package:quiz_app/ui/screens/home/home_screen.dart';
import 'package:quiz_app/ui/screens/setting/setting_screen.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    final screens = [HomeScreen(), UsersScreen(), SettingScreen()];

    return Obx(
      () => Scaffold(
        body: IndexedStack(index: controller.currentIndex.value, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
