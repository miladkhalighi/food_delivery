import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/res/style.dart';

import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundScreens,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.backgroundScreens,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.welcomeScreenBackground,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: AppColors.welcomeScreenBackground,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarDividerColor:
                  AppColors.welcomeScreenBackground,
            )),
        fontFamily: "SF",
        textTheme: TextTheme(
          headlineLarge: const TextStyle(
              fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold),
          bodyMedium: const TextStyle(
              fontSize: 14, color: AppColors.buttonTextColorPrimary),
          labelSmall: const TextStyle(
            fontSize: 14,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppStyle.primeryButton,
        ),
        primarySwatch: Colors.red,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }));

}
