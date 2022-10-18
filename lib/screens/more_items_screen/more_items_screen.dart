
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/controllers/food_controller.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:food_delivery/screens/home_screen/components/food_item.dart';
import 'package:get/get.dart';

import '../../constants/icon_with_texts_widget.dart';

class MoreItemsScreen extends StatefulWidget {
  const MoreItemsScreen({Key? key}) : super(key: key);

  @override
  State<MoreItemsScreen> createState() => _MoreItemsScreenState();
}

class _MoreItemsScreenState extends State<MoreItemsScreen> {

  final _searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    var bodyMargin = 12.0;
    return Obx(
        () =>
      Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context, bodyMargin)
      ),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 84),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: AppBar(
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
                  _searchController.searchItem(_searchController.searchItemName, Get.find<FoodController>().totalFooditems);
              },
              // onSubmitted: (String value) {
              //
              // },


            ),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                onPressed: (){
                  FocusScope.of(context).unfocus();
                  _searchController.searchBarController.clear();
                  Get.back();
                },
                  icon: const Icon(Icons.arrow_back_ios)
              ),
            ),
            leadingWidth: 80,
          ),
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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
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
  
  Widget buildGridView(double bodyMargin) {
    return GridView.custom(
        padding: EdgeInsets.symmetric(horizontal: bodyMargin,vertical: bodyMargin*2),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverStairedGridDelegate(
        //crossAxisCount: 2,
        //crossAxisSpacing: 8,
        //mainAxisSpacing: bodyMargin,
        pattern: [
          const StairedGridTile(0.5, 1/1.5),
          const StairedGridTile(0.5, 1/1.7),
        ],
        //childAspectRatio: 1/1.7,

      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              const Spacer(),
              AspectRatio(aspectRatio: 1/1.5,child: Padding(
                padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                child: FoodItem(item: _searchController.searchItemList[index],),
              ),),
            ],
          );
      },
        childCount: _searchController.searchItemList.length,
      ),
    );
  }
}



