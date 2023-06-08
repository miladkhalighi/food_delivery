import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/res/dimentions.dart';
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
    return Scaffold(
      appBar: buildAppBar(context),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/touch_swipe.svg',
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: AppDimens.bodyMarginSmall,
              ),
              Text(
                'swipe on an item to delete',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.bodyMarginLarge,
          ),
          Expanded(
              child: Obx(() => _cartController.cartList.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cartController.cartList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppDimens.bodyMarginMedium),
                          child: ItemCart(item: _cartController.cartList[index]),
                        );
                      })
                  : buildEmptyCartList())),
          //button
          Obx(() => _cartController.cartList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.bodyMarginLarge),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Complete order'))),
                )
              : const SizedBox.shrink()),
          SizedBox(
            height: AppDimens.bodyMarginSmall,
          ),
        ],
      ),
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
            left: AppDimens.bodyMarginLarge,
            right: AppDimens.bodyMarginLarge,
            bottom: AppDimens.bodyMarginLarge,
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
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: AppDimens.bodyMarginLarge),
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
