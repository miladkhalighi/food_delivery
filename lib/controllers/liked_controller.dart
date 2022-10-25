

import 'package:get/get.dart';

import '../models/item_model.dart';

class LikedController extends GetxController{

  RxList<ItemModel> likedList = RxList();

  void addToLikedList(ItemModel item){
      if(!likedList.contains(item)){
        likedList.add(item);
      }
  }

  void unLikeFromList(ItemModel item){
    if(likedList.contains(item)){
      likedList.remove(item);
    }
  }

  toggleStatus(ItemModel item){
      if(item.liked){
        item.liked = false;
        unLikeFromList(item);
      }else{
        item.liked = true;
        addToLikedList(item);
      }
      update(['change status']);
  }

  getStatus(ItemModel item){
    return item.liked;
  }

  @override
  void onInit() {

    for (var element in itemsList) {
      if(element.liked){
        if(!likedList.contains(element)){
          likedList.add(element);
        }
      }
    }

    super.onInit();
  }

}