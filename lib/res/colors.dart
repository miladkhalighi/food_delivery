import 'package:flutter/material.dart';

class AppColors {
  static const welcomeScreenBackground = Color(0xFFFF4B3A);
  static const primaryColor = Color(0xFFFA4A0C);
  static const secondaryColor = Colors.white;
  static const buttonTextColorPrimary = Color(0xFFFF460A);
  static const buttonTextColorSecondary = Color(0xFFFFFFFF);
  static const backgroundScreens = Color(0xFFF2F2F2);
  static const textFieldInside = Color(0xFFEFEEEE);
  static const statusBarColor = Color(0xFFF2F2F2);
  static const systemNavBarColor = Color(0xFFF2F2F2);

  static final avatorsGradient = [
    AppColors.welcomeScreenBackground.withOpacity(0.01),
    AppColors.welcomeScreenBackground.withOpacity(0.5),
    AppColors.welcomeScreenBackground,
  ];
}
