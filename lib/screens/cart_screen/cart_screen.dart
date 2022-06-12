import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/icon_with_texts_widget.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/item.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  var size = Get.size;
  var bodyMargin = Get.size.width * 0.07;
  final _cartController = Get.find<CartController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/touch_swipe.svg',width: 24,height: 24,),
                const SizedBox(width: 8,),
                Text('swipe on an item to delete',style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),),
              ],
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: Obx(
                  () => _cartController.cartList.isNotEmpty ? 
                      ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cartController.cartList.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMargin,vertical: 8),
                        child: ItemCard(item: _cartController.cartList[index]),
                      );
                    }) :
                      buildEmptyCartList()

              )
            ),

          ],
        ),
      ),
    );
  }

  Stack buildEmptyCartList() {
    return Stack(children: [
                      const IconWithTextsWidget(icon: CupertinoIcons.shopping_cart,
                          title: 'No orders yet',
                          subTitle: 'Hit the orange button down below to Create an order'),
                      Positioned(
                          left: bodyMargin,
                          right: bodyMargin,
                          bottom: bodyMargin,
                          child: ElevatedButton(onPressed: (){
                            Get.back();
                          }, child: const Text('Start odering')))
                    ],);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text('Cart',style: Theme.of(context).textTheme.bodyText1,),
        leading: Padding(
          padding: EdgeInsets.only(left: bodyMargin),
          child: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(CupertinoIcons.left_chevron,color: Colors.black,)),
        ),
      );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _controller = Get.find<CartController>();

    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
          extentRatio: 0.4,
          dismissible: DismissiblePane(
              onDismissed: () {
                _controller.removeFromCart(item);
              }),
          motion: const DrawerMotion(),
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(CupertinoIcons.heart,color: Colors.white,),
                      ),
                      backgroundColor: const Color(0xFFDF2C2C),
                      radius: 24,
                    ),
                    const SizedBox(width: 8,),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: (){
                          _controller.removeFromCart(item);
                          },
                        icon: const Icon(CupertinoIcons.delete,color: Colors.white,),
                      ),
                      backgroundColor: const Color(0xFFDF2C2C),
                      radius: 24,
                    ),
                  ],
                )
              ),
            ),
          ]
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [

                  SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(backgroundImage: AssetImage(item.img),)),
                  const SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),),
                      const SizedBox(height: 8,),
                      Text(item.price,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16,color: SolidColors.primaryColor),),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Container(

              decoration: BoxDecoration(
                color: SolidColors.primaryColor,
                borderRadius: BorderRadius.circular(1000)
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const SizedBox(width: 8,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: Colors.white.withOpacity(0.5),
                          onTap:(){
                            _controller.quantityDecrement(item);
                          },child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Text('-',style: TextStyle(color: Colors.white,fontSize: 20),),
                      )),
                    ),
                    GetBuilder<CartController>(
                        id: 'quantity',
                        builder: (GetxController controller) {
                          return Text(item.quantity.toString(),style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white));
                        },
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white.withOpacity(0.5),
                          onTap:(){
                        _controller.quantityIncrement(item);
                      },child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Text('+',style: TextStyle(color: Colors.white,fontSize: 20),),
                      )),
                    ),
                    const SizedBox(width: 8,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
