import 'package:get/get.dart';

import '../models/item.dart';

class LikedController extends GetxController{

  List<Item> likedList = [];

  void addToLike(Item item){
      likedList.add(item);
      update(['update like']);
  }

  void removeFromLike(Item item){
    likedList.remove(item);
    update(['update like']);
  }

  bool hasliked(Item item){
    return likedList.contains(item);
  }

}