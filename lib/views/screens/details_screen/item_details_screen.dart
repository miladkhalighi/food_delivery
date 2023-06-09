import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/controllers/item_details_controller.dart';
import 'package:food_delivery/res/colors.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ItemModel item;

  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var itemCtr = Get.put(ItemDetailsController());

    return Scaffold(
        backgroundColor: AppColors.backgroundScreens,
        appBar: buildAppBar(context, itemCtr),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(AppDimens.bodyMarginLarge, 0,
              AppDimens.bodyMarginLarge, AppDimens.bodyMarginLarge * 2),
          child: ElevatedButton(
            onPressed: () {
              Get.find<CartController>().addToCart(item);
            },
            child: const Text(
              'Add to cart',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimens.bodyMarginLarge),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: itemCtr.scrollCtr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerImgTitle(itemCtr, size, textTheme),
                    SizedBox(
                      height: AppDimens.bodyMarginLarge * 2,
                    ),
                    Text(
                      'Delivery info',
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: AppDimens.bodyMarginSmall,
                    ),
                    Text(item.deliveryInfo,
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                    SizedBox(
                      height: AppDimens.bodyMarginLarge * 2,
                    ),
                    Text(
                      'Return policy',
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: AppDimens.bodyMarginSmall,
                    ),
                    Text(item.returnPolicy,
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                    SizedBox(
                      height: AppDimens.bodyMarginLarge * 2,
                    ),
                  ],
                ),
              )),
        ));
  }

  Widget headerImgTitle(
      ItemDetailsController itemCtr, Size size, TextTheme textTheme) {
    return Obx(
      () => SizedBox(
        height: size.height / 3 + size.width * 0.2,
        child: Stack(
          children: [
            Positioned(
              top: itemCtr.currentPos.value,
              left: 0,
              right: 0,
              child: Hero(
                tag: item.id,
                child: Container(
                  width: (size.height * 0.25) +
                      (size.width * 0.1) -
                      itemCtr.currentPos.value,
                  height: (size.height * 0.25) +
                      (size.width * 0.1) -
                      itemCtr.currentPos.value,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(item.img), fit: BoxFit.contain),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 32,
                            offset: const Offset(0, 16))
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: itemCtr.animDuration,
                opacity: itemCtr.hideTitle.value ? 0 : 1,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: itemCtr.hideTitle.value ? 0 : 1,
                  child: Text(
                    item.name,
                    style: textTheme.headlineSmall?.copyWith(fontSize: 26),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: itemCtr.animDuration,
                  opacity: itemCtr.hideTitle.value ? 0 : 1,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: itemCtr.hideTitle.value ? 0 : 1,
                    child: Text(
                      item.price,
                      style: textTheme.headlineSmall?.copyWith(
                          fontSize: 20, color: AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, ItemDetailsController itemCtr) {
    final _likedController = Get.find<LikedController>();
    var textTheme = Theme.of(context).textTheme;

    return AppBar(
      iconTheme: IconThemeData(color: Colors.black.withOpacity(0.8)),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.bodyMarginMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  itemCtr.currentPos.value = 0;
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            Obx(
              () => AnimatedOpacity(
                duration: itemCtr.animDuration,
                opacity: itemCtr.hideTitle.value ? 1 : 0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: itemCtr.hideTitle.value ? 1 : 0,
                  child: Text(
                    item.name,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            GetBuilder<LikedController>(
                id: 'change status',
                builder: (context) {
                  return IconButton(
                      onPressed: () {
                        _likedController.toggleStatus(item);
                      },
                      icon: _likedController.getStatus(item)
                          ? const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            )
                          : SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: Colors.black.withOpacity(0.8),
                            ));
                })
          ],
        ),
      ),
    );
  }
}
