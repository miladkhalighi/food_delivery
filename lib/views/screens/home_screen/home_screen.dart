import 'package:flutter/material.dart';
import 'package:food_delivery/res/colors.dart';
import 'package:food_delivery/controllers/home_screen_controller.dart';
import 'package:food_delivery/controllers/search_controller.dart';
import 'package:food_delivery/res/dimentions.dart';
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundScreens,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerText(),
                searchBar(),
                categoriesWidget(_homeController),
                //SizedBox(height: size.height*0.04,),
                seeMoreBtn(),
              ],
            ),
            //SizedBox(height: (size.height * 0.3)+(size.width*0.1) ,child: gridItemsView(_homeController)),
            SizedBox(height: (size.height * 0.3)+(size.width*0.14) ,child: gridItemsView(_homeController)),
          ],
        ),
      ),
    );
  }

  Widget gridItemsView(HomeScreenController _homeController) {
    return Obx(
      () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.5),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _homeController.items.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                    index == 0 ? AppDimens.bodyMarginLarge : AppDimens.bodyMarginMedium,
                    AppDimens.bodyMarginMedium,
                    index == _homeController.items.length - 1
                        ? AppDimens.bodyMarginLarge
                        : AppDimens.bodyMarginMedium,
                    AppDimens.bodyMarginMedium),
                child: FoodItem(
                    item: _homeController.items[index]),
              )),
    );
  }

  Widget seeMoreBtn() {
    var _searchController = Get.find<SearchController>();
    return Padding(
      padding: EdgeInsets.only(right: AppDimens.bodyMarginLarge),
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
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ))),
    );
  }

  Widget categoriesWidget(HomeScreenController _homeController) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05 + size.width* 0.05,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _homeController.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == 0 ? AppDimens.bodyMarginLarge : AppDimens.bodyMarginSmall,
                  8,
                  index == _homeController.categories.length - 1
                      ? AppDimens.bodyMarginLarge
                      : AppDimens.bodyMarginSmall,
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
      padding: EdgeInsets.fromLTRB(
          AppDimens.bodyMarginLarge, AppDimens.bodyMarginMedium, AppDimens.bodyMarginLarge, 0),
      child: Text(
        'Delicious food for you',
        maxLines: 2,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget searchBar() {
    var _searchController = Get.find<SearchController>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.bodyMarginLarge, vertical: AppDimens.bodyMarginLarge * 2),
      child: TextField(
        controller: _searchController.searchBarController,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            fillColor: AppColors.textFieldInside,
            filled: true,
            hintText: 'Search',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: AppColors.textFieldInside)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: AppColors.textFieldInside))),
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
