
import 'package:get/get.dart';

import '../models/item.dart';

class CartController extends GetxController{

  var cartList = [].obs;

  void addToCart(Item item){
    cartList.add(item);
    //update();
  }

  void removeFromCart(Item item){
    cartList.remove(item);
    //update();
  }


}