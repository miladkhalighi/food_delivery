
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/item.dart';
import '../screens/more_items_screen/more_items_screen.dart';

class SearchController extends GetxController{

  String searchItemName = "";
  var searchBarController = TextEditingController(text: "");

  RxList searchItemList = [].obs;

  searchItem(String itemName,List<Item> itemList){
    searchItemList.clear();

    for (var element in itemList) {
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
    searchItemName = "";
    searchItem(searchItemName,itemsList);
  }
}