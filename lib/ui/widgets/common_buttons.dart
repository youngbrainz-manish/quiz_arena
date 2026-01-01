import 'package:flutter/cupertino.dart';
import 'package:quiz_app/core/app_colors.dart';

class CommonButtons {
  Widget textButton({void Function()? onTap, required String title, Color? buttonColor, double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors().buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 40,
        width: width ?? 100,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: AppColors().buttonTextColor, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
