
import 'package:get/get.dart';

class NavigatorController extends GetxController{
  var navItemIndexSelected = 0.obs;

  void changeNavItemIndex(int index){
    navItemIndexSelected.value = index;
  }
}