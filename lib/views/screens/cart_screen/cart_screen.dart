import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/shared_widgets/icon_with_texts_widget.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'item_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: body(context),
      ),
    );
  }

  Column body(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/touch_swipe.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'swipe on an item to delete',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: Dimension.bodyMargin,
          ),
          Expanded(
              child: Obx(() => _cartController.cartList.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cartController.cartList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: Dimension.bodyMargin/2),
                          child:
                              ItemCart(item: _cartController.cartList[index]),
                        );
                      })
                  : buildEmptyCartList())),
          //button
          Obx(() => _cartController.cartList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimension.bodyMargin),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Complete order'))),
                )
              : const SizedBox.shrink()),
          const SizedBox(
            height: Dimension.bodyMargin,
          ),
        ],
      );
  }

  Stack buildEmptyCartList() {
    return Stack(
      children: [
        const IconWithTextsWidget(
            icon: CupertinoIcons.shopping_cart,
            title: 'No orders yet',
            subTitle: 'Hit the orange button down below to Create an order'),
        Positioned(
            left: Dimension.bodyMargin,
            right: Dimension.bodyMargin,
            bottom: Dimension.bodyMargin,
            child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Start odering')))
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Cart',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: Dimension.bodyMargin),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.left_chevron,
              color: Colors.black,
            )),
      ),
    );
  }
}


