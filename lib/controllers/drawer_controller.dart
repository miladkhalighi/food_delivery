
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController{

  var drawerItemIndex = 0.obs;
  final advancedDrawerController = AdvancedDrawerController();

  void changeDrawerItemIndex(int index){
    drawerItemIndex.value = index;
  }
}