

 import 'package:flutter/material.dart';

class SolidColors{
 static const getStartScreenBackground = Color(0xFFFF4B3A);
 static const primaryColor = Color(0xFFFA4A0C);
 static const buttonTextColorRed = Color(0xFFFF460A);
 static const buttonTextColorWhite = Color(0xFFFFFFFF);
 static const backgroundScreens = Color(0xFFF2F2F2);
}

class GradiantColors{
 static final getStartPageGradientLeft = [
  SolidColors.getStartScreenBackground,
  SolidColors.getStartScreenBackground.withOpacity(0.1),
 ];
 static final getStartPageGradientRight = [
  SolidColors.getStartScreenBackground,
  SolidColors.getStartScreenBackground.withOpacity(0.5),
 ];
}
