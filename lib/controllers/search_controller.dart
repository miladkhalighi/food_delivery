
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/controllers/home_screen_controller.dart';
import 'package:food_delivery/views/screens/more_items_screen/more_items_screen.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';

class SearchController extends GetxController{

  RxString searchItemName = "".obs;
  var searchBarController = TextEditingController(text: "");

  RxList<ItemModel> searchItemList = RxList();

  searchItem(String itemName){
    searchItemList.clear();

    for (var element in Get.find<HomeScreenController>().items) {
      if(element.name.toUpperCase().contains(itemName.toUpperCase())){
        searchItemList.add(element);
      }
    }
  }

  submitSearch() {
    if(searchItemName.isNotEmpty){
      //searchItem(searchItemName,);
      Get.to(() =>const MoreItemsScreen());
    }
  }

  showWholeItems(){
    searchItemName.value = "";
    searchItem(searchItemName.value);
  }
}