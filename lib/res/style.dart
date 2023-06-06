import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class AppStyle {
  AppStyle._();
  static var primeryButton = ElevatedButton.styleFrom(
      minimumSize: Size(Get.size.width * 0.7, 64),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.buttonTextColorSecondary,
      shape: const StadiumBorder(),
      textStyle: Get.textTheme.button);

  static var secondaryButton = ElevatedButton.styleFrom(
      minimumSize: Size(Get.size.width * 0.7, 64),
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.primaryColor,
      shape: const StadiumBorder(),
      textStyle: Get.textTheme.button);
}
