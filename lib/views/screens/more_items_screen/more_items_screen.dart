
import 'package:flutter/material.dart';
import 'package:food_delivery/views/shared_widgets/icon_with_texts_widget.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:food_delivery/views/shared_widgets/custom_grid_view_with_title.dart';
import 'package:get/get.dart';

class MoreItemsScreen extends StatefulWidget {
  const MoreItemsScreen({Key? key}) : super(key: key);

  @override
  State<MoreItemsScreen> createState() => _MoreItemsScreenState();
}

class _MoreItemsScreenState extends State<MoreItemsScreen> {

  final _searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () =>
      Scaffold(
        appBar: buildAppBar(),
        body: body()
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 84),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            title: TextField(
              controller: _searchController.searchBarController,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                  filled: false,
                  hintText: 'Search',
                  isDense: false,
                  border: InputBorder.none,
              ),
              onChanged: (value ){
                  _searchController.searchItemName.value = value;
                  _searchController.searchItem(_searchController.searchItemName.value);
              },


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
  Widget body() {
    return _searchController.searchItemList.isEmpty ?
    const IconWithTextsWidget(
      icon: Icons.search_rounded,
      title: 'Item not found',
      subTitle: '',
    ) : CustomGridViewWithTitle(items: _searchController.searchItemList);
  }

}






