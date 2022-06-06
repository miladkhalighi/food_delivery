
import 'package:food_delivery/controllers/category_controller.dart';
import 'package:food_delivery/controllers/food_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => CategoryController());
  }

}