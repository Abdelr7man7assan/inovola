import 'package:flutter/material.dart';

class AppColors {
  static const primaryBlue = Color(0xFF2E64FE);
  static const lightGrey = Color(0xFFF5F5F5);
  static const cardBlue = Color(0xFA61AFFF);// Adjust as needed
  static const background = Color(0xFFF8F9FA);
  static const cardBackground = Colors.white;
  static const textPrimary = Color(0xFF1C1C1E);
  static const textSecondary = Color(0xFF8E8E93);
  static const successGreen = Color(0xFF4CD964);
  static const errorRed = Color(0xFFFF3B30);
  static const inputBorder = Color(0xFFD1D1D6);
  static const iconColor = Color(0xFF9A9A9A);
  static const shadowColor = Color(0x1A000000);
  static const iconBackgrounds = {
    'Groceries': Color(0xFFE4E9FF),
    'Entertainment': Color(0xFF265BFA),
    'Gas': Color(0xFFFFA6D6),
    'Shopping': Color(0xFFFFEEC2),
    'News Paper': Color(0xFFFFEDD9),
    'Transport': Color(0xFFE8D6FF),
    'Rent': Color(0xFFFFE2CC),
    'Add': Colors.white,
  };
}

class AppTextStyles {
  static const titleVeryLarge =TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryBlue,
  );

  static const titleLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const bodyRegular = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const inputHint = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const errorText = TextStyle(
    fontSize: 14,
    color: AppColors.errorRed,
  );
}
