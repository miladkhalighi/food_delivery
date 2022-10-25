
import 'package:food_delivery/constants/constants.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';

class CartController extends GetxController{

  var cartList = [itemsList[0],itemsList[1]].obs;

  void addToCart(ItemModel item){
    if(Get.isSnackbarOpen){
      Get.closeCurrentSnackbar();
    }
    if(cartList.contains(item)){
      //already added
      customSnackBar('Add to cart', 'this item has already added to cart');

    }else{
      item.quantity = 1;
      cartList.add(item);
      customSnackBar('Add to cart', '${item.name} successfully added to cart');
      //update(['updateCartList']);
    }

  }

  void removeFromCart(ItemModel item){
    cartList.remove(item);
    customSnackBar('Item removed', '${item.name} removed from cart');
    //update(['updateCartList']);
  }


  quantityIncrement(ItemModel item){
    if(item.quantity <9){
      item.quantity += 1;
      update(['quantity']);
    }else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
      customSnackBar('Wrong quantity', 'quantity can not be upper than 9');
    }

  }

  quantityDecrement(ItemModel item){
    if(item.quantity > 1){
      item.quantity -= 1;
      update(['quantity']);
    }
    else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
      customSnackBar('Wrong quantity', 'quantity can not be lower than 1');
    }

  }


}