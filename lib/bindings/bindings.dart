import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/drawer_controller.dart';
import 'package:food_delivery/controllers/home_screen_controller.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:food_delivery/controllers/navigator_controller.dart';
import 'package:food_delivery/controllers/my_search_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => MySearchController());
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => MyDrawerController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LikedController());
  }
}
