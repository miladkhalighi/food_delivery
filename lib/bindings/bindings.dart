
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/category_controller.dart';
import 'package:food_delivery/controllers/drawer_controller.dart';
import 'package:food_delivery/controllers/food_controller.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:food_delivery/controllers/navigator_controller.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => MyDrawerController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LikedController());
    Get.lazyPut(() => FoodController());
  }

}