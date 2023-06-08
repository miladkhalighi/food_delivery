import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:get/get.dart';

import 'food_item.dart';

class LargeGrid extends StatelessWidget {
  final RxList<ItemModel> list;
  final bool showHero;
  const LargeGrid({required this.list, this.showHero = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.bodyMarginMedium,
          vertical: AppDimens.bodyMarginLarge
          ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.4,
          mainAxisSpacing: size.height * 0.1,
          crossAxisCount: 5),
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppDimens.bodyMarginLarge),
          child: FoodItem(
            item: list[index],
            showHero: showHero,
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
