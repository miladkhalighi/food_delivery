

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
      barBlur: 12,
      backgroundColor: SolidColors.primaryColor.withOpacity(0.3)
  );
}