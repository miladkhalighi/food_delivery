

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'colors.dart';

class Constants {
  var size = Get.size;
  var bodyMargin = Get.size.width * 0.7;
}

void customSnackBar(String title,String msg){
  Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      barBlur: 8,
      backgroundColor: SolidColors.primaryColor.withOpacity(0.3),
      titleText: Text(title,style: const TextStyle(color: Color(0xFFDF2C2C),fontSize: 18,fontWeight: FontWeight.bold),),
      messageText: Text(msg,style: const TextStyle(color: Colors.black45,fontSize: 15,)
      )
  );
}