import 'package:flutter/material.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:food_delivery/views/shared_widgets/large_grid.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../models/item_model.dart';
import 'small_grid.dart';

class CustomGridViewWithTitle extends StatelessWidget {
  final RxList<ItemModel> items;
  final bool showHero;
  const CustomGridViewWithTitle(
      {required this.items, this.showHero = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppDimens.bodyMarginMedium,
                ),
                Text(
                  'Found ${items.length} results',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 24),
                ),
                constraints.maxWidth < 500 || MediaQuery.of(context).orientation == Orientation.portrait
                    ? SmallGrid(
                        list: items,
                        showHero: showHero,
                      )
                    : LargeGrid(
                        list: items,
                        showHero: showHero,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
