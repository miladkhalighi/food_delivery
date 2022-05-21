import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedItemIndex;
  const BottomNavBar({required this.onTap,this.selectedItemIndex = 0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){
            onTap(0);
          },
              icon: Icon(Icons.home_outlined,size: 31,
                color: selectedItemIndex ==0 ? SolidColors.primaryColor : Colors.grey,)

          ),
          IconButton(onPressed: (){
            onTap(1);
          },
              icon: SvgPicture.asset('assets/icons/heart.svg',color: selectedItemIndex==1 ? SolidColors.primaryColor : null,)
          ),
          IconButton(onPressed: (){
            onTap(2);
          }, icon: SvgPicture.asset('assets/icons/user.svg',color: selectedItemIndex==2 ? SolidColors.primaryColor : null,)),
          IconButton(onPressed: (){
            onTap(3);
          }, icon: SvgPicture.asset('assets/icons/ic_sharp-history.svg',color: selectedItemIndex==3 ? SolidColors.primaryColor : null,)),
        ],
      ),
    );
  }
}