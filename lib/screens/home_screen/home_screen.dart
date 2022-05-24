
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/models/item.dart';
import 'package:food_delivery/screens/more_items_screen/more_items_screen.dart';

import '../item_details/ItemDetails.dart';
import 'components/bottom_nav_bar.dart';
import 'components/category_item.dart';
import 'components/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  String searchTxt = "";
  var _categoryItemIndex = 0;
  submitSearch(BuildContext context) {
    List<Item> searchItemList = [];
    for (var element in itemsList) {
      if(element.name.toUpperCase().contains(searchTxt.toUpperCase())){
        searchItemList.add(element);
      }
    }
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) { //prevent "setState() or markNeedsBuild called during build" error
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MoreItemsScreen(itemList: searchItemList)));
    });

  }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;
    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            //header text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyMargin),
              child: Text('Delicious \nfood for you',style: Theme.of(context).textTheme.headline2,),
            ),
            const SizedBox(height: 32,),
            searchBar(bodyMargin),
            const SizedBox(height: 32,),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: SizedBox(
                height: size.height * 0.07,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryItem(name: categoryList[index].name, pressed: (){
                          setState(() {
                            _categoryItemIndex = index;
                          });
                      },
                       enabled: index == _categoryItemIndex ? true : false,
                      ),
                    );
                }),
              ),
            ),
            //const SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin),
              child: Align(
                alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> MoreItemsScreen(itemList: itemsList,)));
                  }, child: Text('see more',style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),))),
            ),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: SizedBox(
                width: double.infinity,
                height: size.height/2.5,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: itemsList.length,
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: FoodItem(
                      width: size.width/2.5, item: itemsList[index],
                ),
                    )
                ),
              )
            ),

          ],
        ),
      ),
    );
  }




  Padding searchBar(double bodyMargin) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: TextField(
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
                searchTxt = value;
              });
            },
            onSubmitted: (String value) {
              submitSearch(context);
              },


          ),
        );
  }
}










