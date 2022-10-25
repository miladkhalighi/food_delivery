import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../constants/constants.dart';
import '../../models/item_model.dart';
import 'custom_grid_view.dart';

class CustomGridViewWithTitle extends StatelessWidget {
  final RxList<ItemModel> items;
  final bool showHero;
  const CustomGridViewWithTitle({required this.items,this.showHero=true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Dimension.bodyMargin,),
            Text('Found ${items.length} results',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24),),
            CustomGridView(list: items,showHero: showHero,),
          ],
        ),
      ),
    );
  }
}