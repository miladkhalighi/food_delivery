import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/screens/home_screen/components/food_item.dart';

import '../../models/item.dart';

class MoreItemsScreen extends StatelessWidget {
  final List<Item> itemList;
  const MoreItemsScreen({required this.itemList,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Text('Found ${itemList.length} results',style: Theme.of(context).textTheme.bodyText1,),
        centerTitle: true,
      ),
      body: buildGridView(bodyMargin),
    );
  }

  StaggeredGrid buildStaggeredGrid(double bodyMargin) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: bodyMargin,
      mainAxisSpacing: bodyMargin,
        children: List.generate(
            itemList.length, (index) =>
            StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: index.isEven? 1.6 :2, child: FoodItem(item: itemList[index],)),
        )
    );
  }

  GridView buildGridView(double bodyMargin) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: bodyMargin,
        mainAxisSpacing: bodyMargin,
        childAspectRatio: 1/1.6,
        padding: EdgeInsets.all(bodyMargin),
        physics: const BouncingScrollPhysics(),
        children: List.generate(itemList.length, (index) =>
            FoodItem(
                item: itemList[index],
            )
        ),
    );
  }
}
