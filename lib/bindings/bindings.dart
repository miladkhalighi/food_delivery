
import 'package:food_delivery/controllers/category_controller.dart';
import 'package:food_delivery/controllers/drawer_controller.dart';
import 'package:food_delivery/controllers/food_controller.dart';
import 'package:food_delivery/controllers/navigator_controller.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => MyDrawerController());
    Get.lazyPut(() => SearchController());
  }

}