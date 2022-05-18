
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    return Scaffold(
      backgroundColor: SolidColors.backgroundScreens,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          ),
          const SizedBox(height: 32,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMargin),
            child: Text('Delicious \nfood for you',style: Theme.of(context).textTheme.headline2,),
          ),
          const SizedBox(height: 32,),
          TextField(
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            fillColor: SolidColors.textFieldInside,
            ),

          )
        ],
      ),
    );
  }
}
