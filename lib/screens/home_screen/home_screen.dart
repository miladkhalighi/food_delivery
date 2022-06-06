
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/controllers/category_controller.dart';
import 'package:food_delivery/controllers/food_controller.dart';
import 'package:food_delivery/screens/more_items_screen/more_items_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'components/category_item.dart';
import 'components/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var size = Get.size;
    var bodyMargin = size.width * 0.07;
    var _foodController  = Get.find<FoodController>();
    var _categoryController  = Get.find<CategoryController>();

    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderText(bodyMargin, context),
            searchBar(bodyMargin),
            buildCategoriesWidget(bodyMargin, size, _categoryController),
            buildSeeMoreBtn(bodyMargin, context, _foodController),
            gridFoodItems(bodyMargin, size, _foodController),

          ],
        ),
      ),
    );
  }

  Widget gridFoodItems(double bodyMargin, Size size, FoodController _foodController) {
    return SizedBox(
      width: double.infinity,
      height: size.height/2.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _foodController.itemsList.length,
          itemBuilder: (context,index)=>Padding(
            padding: EdgeInsets.fromLTRB(index == 0 ? bodyMargin : 16,16,index == _foodController.itemsList.length-1 ? bodyMargin : 16,16),
            child: FoodItem(
            width: size.width/2.5, item: _foodController.itemsList[index],
      ),
          )
      ),
    );
  }

  Widget buildSeeMoreBtn(double bodyMargin, BuildContext context, FoodController _foodController) {
    return Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: Align(
              alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> MoreItemsScreen(itemList: _foodController.itemsList,)));
                }, child: Text('see more',style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),))),
          );
  }

  Widget buildCategoriesWidget(double bodyMargin, Size size, CategoryController _categoryController) {
    return SizedBox(
      height: size.height * 0.07,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _categoryController.categoryList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin : 8,8,index==_categoryController.categoryList.length-1 ? bodyMargin : 8,8),
            child: Obx(() =>
              CategoryItem(name: _categoryController.categoryList[index].name, pressed: (){
                _categoryController.categoryItemIndex.value = index;
              },
               enabled: _categoryController.categoryItemIndex.value == index ? true : false,
              ),
            ),
          );
      }),
    );
  }

  Widget buildHeaderText(double bodyMargin, BuildContext context) {
    return Padding(
            padding: EdgeInsets.fromLTRB(bodyMargin,16,bodyMargin,0),
            child: Text('Delicious \nfood for you',style: Theme.of(context).textTheme.headline2,),
          );
  }

  Widget searchBar(double bodyMargin) {
    var _foodController  = Get.find<FoodController>();
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin,vertical: 32),
          child: TextField(
            controller: _foodController.searchBarController,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            fillColor: SolidColors.textFieldInside,
            filled: true,
            hintText: 'Search',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                borderSide: BorderSide(color: SolidColors.textFieldInside)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1000)),
              borderSide: BorderSide(color: SolidColors.textFieldInside)
            )
            ),
            onChanged: (value ){
              setState(() {
                _foodController.searchItemName = value;
              });
            },
            onSubmitted: (String value) {
              _foodController.submitSearch();
              },


          ),
        );
  }
}










