
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:food_delivery/screens/home_screen/components/food_item.dart';
import 'package:get/get.dart';

import '../../constants/icon_with_texts_widget.dart';
import '../../models/item.dart';

class MoreItemsScreen extends StatefulWidget {
  const MoreItemsScreen({Key? key}) : super(key: key);

  @override
  State<MoreItemsScreen> createState() => _MoreItemsScreenState();
}

class _MoreItemsScreenState extends State<MoreItemsScreen> {

  final _searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;
    return Obx(
        () =>
      Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black
          ),
          title: TextField(
            style: Theme.of(context).textTheme.bodyText1,
            controller: _searchController.searchBarController,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
                filled: false,
                hintText: 'Search',
              isDense: false,
              border: InputBorder.none,
            ),
            onChanged: (value ){
                _searchController.searchItemName = value;
                _searchController.searchItem(_searchController.searchItemName, itemsList);
            },
            // onSubmitted: (String value) {
            //
            // },


          ),
          centerTitle: true,
        ),
        body: buildBody(context, bodyMargin)
      ),
    );
  }

  Widget buildBody(BuildContext context, double bodyMargin) {
    return _searchController.searchItemList.isEmpty ?
    const IconWithTextsWidget(
      icon: Icons.search_rounded,
      title: 'Item not found',
      subTitle: '',
    ) : Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16,),
            Text('Found ${_searchController.searchItemList.length} results',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24),),
            buildGridView(bodyMargin),
          ],
        ),
      ),
    );
  }

  // StaggeredGrid buildStaggeredGrid(double bodyMargin) {
  //   return StaggeredGrid.count(
  //     crossAxisCount: 2,
  //     crossAxisSpacing: bodyMargin,
  //     mainAxisSpacing: bodyMargin,
  //       children: List.generate(
  //           _searchController.searchItemList.length, (index) =>
  //           StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: index.isEven? 1.6 :2, child: FoodItem(item: widget.itemList[index],)),
  //       )
  //   );
  // }

  GridView buildGridView(double bodyMargin) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: bodyMargin,
        mainAxisSpacing: bodyMargin,
        childAspectRatio: 1/1.6,
        padding: EdgeInsets.all(bodyMargin),
        physics: const BouncingScrollPhysics(),
        children: List.generate(_searchController.searchItemList.length, (index) =>
            FoodItem(
                item: _searchController.searchItemList[index],
            )
        ),
    );
  }
}



