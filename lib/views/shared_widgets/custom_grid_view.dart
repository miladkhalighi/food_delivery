import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:get/get.dart';

import 'food_item.dart';

class CustomGridView extends StatelessWidget {
  final RxList<ItemModel> list;
  final bool showHero;
  const CustomGridView({required this.list,this.showHero = true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> GridView.custom(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.bodyMargin,vertical: Dimension.bodyMargin*2),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverStairedGridDelegate(
          //crossAxisCount: 2,
          //crossAxisSpacing: 8,
          //mainAxisSpacing: bodyMargin,
          pattern: [
            const StairedGridTile(0.5, 1/1.5),
            const StairedGridTile(0.5, 1/1.75),
          ],
          //childAspectRatio: 1/1.7,

        ),
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            return Column(
              children: [
                const Spacer(),
                AspectRatio(aspectRatio: 1/1.5,child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimension.bodyMargin/2),
                  child: FoodItem(item: list[index],showHero: showHero,),
                ),),
              ],
            );
          },
          childCount: list.length,
        ),
      ),
    );
  }
}
