import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/controllers/home_screen_controller.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:food_delivery/models/item_model.dart';
import 'package:food_delivery/views/screens/more_items_screen/more_items_screen.dart';
import 'package:food_delivery/views/shared_widgets/food_item.dart';
import 'package:get/get.dart';
import 'category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

///   follow me on  =>
///
///   Github/MiladKhalighi
///

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _homeController = Get.find<HomeScreenController>();

    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(),
            searchBar(),
            categoriesWidget(_homeController),
            seeMoreBtn(),
            gridItemsView(_homeController),
          ],
        ),
      ),
    );
  }

  Widget gridItemsView(HomeScreenController _homeController) {
    return SizedBox(
      width: double.infinity,
      height: Dimension.size.height / 2.8,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _homeController.items.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(
                      index == 0 ? Dimension.bodyMargin : 16,
                      16,
                      index == _homeController.items.length - 1
                          ? Dimension.bodyMargin
                          : 16,
                      16),
                  child: FoodItem(
                      width: Dimension.size.width / 2.5,
                      item: _homeController.items[index]),
                )),
      ),
    );
  }

  Widget seeMoreBtn() {
    var _searchController = Get.find<SearchController>();
    return Padding(
      padding: const EdgeInsets.only(right: Dimension.bodyMargin),
      child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                _searchController.showWholeItems();
                FocusScope.of(context).unfocus();
                _searchController.searchBarController.clear();
                //Get.to( () => const MoreItemsScreen());
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (contex) => const MoreItemsScreen()));
              },
              child: Text(
                'see more',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontWeight: FontWeight.bold),
              ))),
    );
  }

  Widget categoriesWidget(HomeScreenController _homeController) {
    return SizedBox(
      height: Dimension.size.height * 0.07,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _homeController.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == 0 ? Dimension.bodyMargin : 8,
                  8,
                  index == _homeController.categories.length - 1
                      ? Dimension.bodyMargin
                      : 8,
                  8),
              child: Obx(
                () => CategoryItem(
                  name: _homeController.categories[index],
                  pressed: () {
                    _homeController.categoryItemSelected.value = index;
                    _homeController.getItems();
                  },
                  enabled: _homeController.categoryItemSelected.value == index
                      ? true
                      : false,
                ),
              ),
            );
          }),
    );
  }

  Widget headerText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Dimension.bodyMargin, 16, Dimension.bodyMargin, 0),
      child: Text(
        'Delicious \nfood for you',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget searchBar() {
    var _searchController = Get.find<SearchController>();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimension.bodyMargin, vertical: Dimension.bodyMargin * 2),
      child: TextField(
        controller: _searchController.searchBarController,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            fillColor: SolidColors.textFieldInside,
            filled: true,
            hintText: 'Search',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: SolidColors.textFieldInside)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: SolidColors.textFieldInside))),
        onChanged: (value) {
          _searchController.searchItemName.value = value;
        },
        onSubmitted: (String value) {
          _searchController.searchItemName.value = value;
          _searchController.searchItem(_searchController.searchItemName.value);
          _searchController.submitSearch();
        },
      ),
    );
  }
}
