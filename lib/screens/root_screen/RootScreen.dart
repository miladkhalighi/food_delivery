import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/profile_screen/profile_screen.dart';

import '../home_screen/components/bottom_nav_bar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  var _bottomNavItemIndex = 0;
  Widget buildAppBar(double bodyMargin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {  },
          icon: SvgPicture.asset('assets/icons/menu_icon.svg',width: 24,height: 24,),
        ),
        IconButton(
          onPressed: () {  },
          icon: SvgPicture.asset('assets/icons/shopping-cart.svg',width: 24,height: 24,),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;

    return Scaffold(
      appBar: AppBar(
        title: buildAppBar(bodyMargin),
      ),
      body: IndexedStack(
        index: _bottomNavItemIndex,
        children: const [
          HomeScreen(),
          SizedBox(), //todo : replace screen with sizedbox
          ProfileScreen(),
          SizedBox() ////todo : replace screen with sizedbox
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedItemIndex: _bottomNavItemIndex,
        onTap: (value ) {
          setState(() {
            _bottomNavItemIndex = value;
          });
        },),
    );
  }
}
