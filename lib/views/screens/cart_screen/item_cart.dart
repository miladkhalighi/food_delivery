import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/res/colors.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:get/get.dart';

import '../details_screen/item_details_screen.dart';

class ItemCart extends StatelessWidget {
  final ItemModel item;

  const ItemCart({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cartController = Get.find<CartController>();
    var _likedController = Get.find<LikedController>();

    var textTheme = Theme.of(context).textTheme;

    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
          extentRatio: 0.4,
          dismissible: DismissiblePane(onDismissed: () {
            _cartController.removeFromCart(item);
          }),
          motion: const ScrollMotion(),
          //behind
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: GetBuilder<LikedController>(
                      id: 'change status',
                      builder: (builderCnt) => IconButton(
                        onPressed: () {
                          _likedController.toggleStatus(item);
                        },
                        icon: _likedController.getStatus(item)
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.white,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    backgroundColor: const Color(0xFFDF2C2C),
                    radius: 24,
                  ),
                  SizedBox(
                    width: AppDimens.bodyMarginSmall,
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        _cartController.removeFromCart(item);
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: const Color(0xFFDF2C2C),
                    radius: 24,
                  ),
                ],
              ),
            ),
          ]),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(item: item)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: item.id,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(item.img), fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: AppDimens.bodyMarginLarge,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppDimens.bodyMarginSmall,),
                     Text(
                          item.price,
                          style: textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 16,
                                  color: AppColors.primaryColor),
                        ),
                    SizedBox(
                      height: AppDimens.bodyMarginSmall,
                    ),
                    //const SizedBox(height: 16,),
                  ],
                ),
                const Spacer(), 
                 Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(1000)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    splashColor:
                                        Colors.white.withOpacity(0.5),
                                    onTap: () {
                                      _cartController
                                          .quantityDecrement(item);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    )),
                              ),
                              GetBuilder<CartController>(
                                id: 'quantity',
                                builder: (GetxController controller) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(item.quantity.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                color: Colors.white)),
                                  );
                                },
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    splashColor:
                                        Colors.white.withOpacity(0.5),
                                    onTap: () {
                                      _cartController
                                          .quantityIncrement(item);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
