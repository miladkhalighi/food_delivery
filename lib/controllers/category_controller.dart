
import 'package:get/get.dart';

import '../models/category.dart';

class CategoryController extends GetxController{

  List<CategoryModel> categoryList = [
    CategoryModel(name: 'Foods'),
    CategoryModel(name: 'Drinks'),
    CategoryModel(name: 'Snacks'),
    CategoryModel(name: 'Sauce'),
  ];

  var categoryItemIndex = 0.obs;

}