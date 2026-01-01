import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidget {
  defaultLoader() {
    return CircularProgressIndicator();
  }

  showMessageDialog({
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onPressed,
  }) {
    return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message, style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Text(buttonText),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
