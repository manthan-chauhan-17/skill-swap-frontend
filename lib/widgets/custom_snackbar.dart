import 'package:flutter/material.dart';
import 'package:skill_swap_frontend/imports.dart';

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = AppColors.white,
    int durationInSeconds = 4,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.body(context).copyWith(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: durationInSeconds),
        behavior: SnackBarBehavior.floating, // Floating style
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14 * getResponsive(context)),
        ),
      ),
    );
  }
}
