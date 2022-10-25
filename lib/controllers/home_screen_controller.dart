import 'package:get/get.dart';

import '../models/item_model.dart';

class HomeScreenController extends GetxController{

  List<String> categories = [
    "All","Dessert","Food","Sea food"
  ];

  var categoryItemSelected = 0.obs;

  RxList items = [].obs;

  getItems() async {
    items.clear();
    if (categories[categoryItemSelected.value].toUpperCase() == "ALL") {
      for (var element in itemsList) {
        if(!items.contains(element)){
          await Future.delayed(const Duration(milliseconds: 10));
          items.add(element);
        }
      }
    }
    else {
      for (var item in itemsList) {
        for (var cat in item.category){
          if(cat.toUpperCase()==categories[categoryItemSelected.value].toUpperCase()){
            if(!items.contains(item)){
              await Future.delayed(const Duration(milliseconds: 10));
              items.add(item);
            }
          }
        }
      }
    }
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}