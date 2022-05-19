
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/models/item.dart';

import 'components/category_item.dart';
import 'components/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  String searchTxt = "";
  int categoryItemIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(bodyMargin),
            const SizedBox(height: 32,),
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
                            categoryItemIndex = index;
                          });
                      },
                       enabled: index == categoryItemIndex ? true : false,
                      ),
                    );
                }),
              ),
            ),
            const SizedBox(height: 32,),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: SizedBox(
                width: double.infinity,
                height: size.height/2.2,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: itemsList.length,
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: FoodItem(
                      width: size.width/2.5,
                        name: itemsList[index].name,
                        price: itemsList[index].price,
                        img: itemsList[index].img,
                ),
                    )
                ),
              )
            ),
            const SizedBox(height: 32,),

          ],
        ),
      ),
    );
  }

  Padding buildAppBar(double bodyMargin) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){},
                  child: SvgPicture.asset('assets/icons/menu_icon.svg',width: 24,height: 24,)
              ),
              InkWell(
                  onTap: (){},
                  child: SvgPicture.asset('assets/icons/shopping-cart.svg',width: 24,height: 24,)
              ),
            ],
          ),
        );
  }

  Padding searchBar(double bodyMargin) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: TextField(
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

          ),
        );
  }
}





