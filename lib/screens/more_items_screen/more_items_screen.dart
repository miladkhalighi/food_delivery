import 'package:flutter/material.dart';
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
      ),
      body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: bodyMargin,
          mainAxisSpacing: bodyMargin,
          childAspectRatio: 1/1.5,
          padding: EdgeInsets.all(bodyMargin),
          physics: const BouncingScrollPhysics(),
          children: List.generate(itemList.length, (index) =>
              FoodItem(
                  item: itemList[index],
              )
          ),
      ),
    );
  }
}
