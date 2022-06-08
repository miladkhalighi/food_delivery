import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/controllers/drawer_controller.dart';
import 'package:food_delivery/controllers/navigator_controller.dart';
import 'package:food_delivery/models/drawer_model.dart';
import 'package:food_delivery/screens/cart_screen/cart_screen.dart';
import 'package:food_delivery/screens/history_screen/history_screen.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/liked_screen/liked_screen.dart';
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
  final _drawerController = Get.find<MyDrawerController>();


  Widget buildAppBar(double bodyMargin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            _drawerController.advancedDrawerController.showDrawer();
          },
          icon: SvgPicture.asset('assets/icons/menu_icon.svg',width: 24,height: 24,),
        ),
        IconButton(
          onPressed: () {
            Get.to(()=> const CartScreen());
          },
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
      LikedScreen(),
      ProfileScreen(),
      HistoryScreen()
    ];

    return AdvancedDrawer(
      backdropColor: SolidColors.primaryColor,
      controller: _drawerController.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 0.7,
      openRatio: 1/2.2,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      drawer: buildDrawer(),
      child: buildScaffoldPage(bodyMargin, screens),
    );
  }

  Scaffold buildScaffoldPage(double bodyMargin, List<Widget> screens) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: buildAppBar(bodyMargin),
        ),

        body: Obx(
          () =>
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

  Widget buildDrawer() {
    return Drawer(
      elevation: 0,
      backgroundColor: SolidColors.primaryColor,
      child: Column(
        children: [
          SizedBox(height: Get.height* 0.1,),
          ListView.separated(
            itemCount: drawerList.length-1,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: (){
                  _drawerController.changeDrawerItemIndex(index);
                  switch (_drawerController.drawerItemIndex.value){
                    case 0 :
                      _navigatorController.changeNavItemIndex(2);
                      _drawerController.advancedDrawerController.hideDrawer();
                      //Get.to(()=> const ProfileScreen());
                      break;

                    case 1 :
                      break;

                    case 2 :
                      break;

                    case 3 :
                      break;

                    case 4 :
                      break;

                    case 5 :
                      break;
                  }
                },
                horizontalTitleGap: 0,
                title: Text(drawerList[index].title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),),
                leading: SvgPicture.asset(drawerList[index].iconPath,color: Colors.white,)
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.white.withOpacity(0.3),thickness: 2,indent: 60,);
            },

          ),
          const Spacer(),
          InkWell(
            onTap: (){
              _drawerController.changeDrawerItemIndex(drawerList.length);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Text(drawerList.last.title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 8,),
                SvgPicture.asset(drawerList.last.iconPath,color: Colors.white,)
                //Icon(drawerList.last.icon,color: Colors.white,),
              ],),
            ),
          ),
          SizedBox(height: Get.height* 0.2,),
        ],
      ),
    );
  }
}
