import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemDetailsController extends GetxController {
  late ScrollController scrollCtr;
  RxBool hideTitle = false.obs;
  RxDouble currentPos = 0.0.obs;

  var animDuration = const Duration(milliseconds: 600);

  scrollListener() {
    if (scrollCtr.hasClients) {
      if (scrollCtr.offset >= scrollCtr.position.maxScrollExtent) {
        //print('reach the bottom');
        hideTitle.value = true;
      } else if (scrollCtr.offset <= scrollCtr.position.minScrollExtent) {
        //print('reach to the top');
        hideTitle.value = false;
      }
      if (currentPos < scrollCtr.offset) {
        currentPos.value = scrollCtr.offset;
      } else {
        currentPos.value = scrollCtr.offset;
      }

      currentPos.value = currentPos.value > 150 ? 150 : currentPos.value;
    }
  }

  @override
  void onInit() {
    scrollCtr = ScrollController();
    scrollCtr.addListener(scrollListener);

    super.onInit();
  }

  @override
  void onClose() {
    scrollCtr.dispose();
    super.onClose();
  }
}
