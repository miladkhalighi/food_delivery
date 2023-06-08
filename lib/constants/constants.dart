import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery/res/colors.dart';

void customSnackBar(String title, String msg) {
  Get.snackbar(title, msg,
      snackPosition: SnackPosition.TOP,
      barBlur: 8,
      backgroundColor: AppColors.primaryColor.withOpacity(0.3),
      titleText: Text(
        title,
        style: const TextStyle(
            color: Color(0xFFDF2C2C),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      messageText: Text(msg,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 15,
          )));
}
