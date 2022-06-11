
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/constanst.dart';
import 'package:get/get.dart';

import '../models/item.dart';

class CartController extends GetxController{

  var cartList = [].obs;

  void addToCart(Item item){
    if(cartList.contains(item)){
      //already added
      customSnackBar('Add to cart', 'this item has already added to cart');

    }else{
      cartList.add(item);
      customSnackBar('Add to cart', '${item.name} successfully added to cart');
      //update(['updateCartList']);
    }

  }

  void removeFromCart(Item item){
    cartList.remove(item);
    customSnackBar('Item removed', '${item.name} removed from cart');
    //update(['updateCartList']);
  }


  quantityIncrement(Item item){
    if(item.quantity <9){
      item.quantity += 1;
      update(['quantity']);
    }else{
      customSnackBar('Wrong quantity', 'quantity can not be upper than 9');
    }

  }

  quantityDecrement(Item item){
    if(item.quantity > 1){
      item.quantity -= 1;
      update(['quantity']);
    }
    else{
      customSnackBar('Wrong quantity', 'quantity can not be lower than 1');
    }

  }


}