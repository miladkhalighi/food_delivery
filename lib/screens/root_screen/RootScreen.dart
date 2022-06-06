import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/controllers/navigator_controller.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../home_screen/components/bottom_nav_bar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  final _navigatorController = Get.find<NavigatorController>();

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

    List<Widget> screens = const [
      HomeScreen(),
      SizedBox(), //todo : replace screen with sizedbox
      ProfileScreen(),
      SizedBox() ////todo : replace screen with sizedbox
    ];

    return Scaffold(
      appBar: AppBar(
        title: buildAppBar(bodyMargin),
      ),
      body: GetBuilder<NavigatorController>(
        id: 'change nav item index',
        builder: (context) =>
        IndexedStack(
          index: _navigatorController.navItemIndexSelected.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(() =>
        BottomNavBar(
          selectedItemIndex: _navigatorController.navItemIndexSelected.value,
          onTap: (value ) {
            _navigatorController.navItemIndexSelected.value = value;
            _navigatorController.changeNavItemIndex(_navigatorController.navItemIndexSelected.value);
          },),
      ),
    );
  }
}
