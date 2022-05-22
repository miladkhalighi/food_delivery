import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/root_screen/RootScreen.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    var avatorHeights = size.height/2;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: SolidColors.getStartScreenBackground,
      ),
      backgroundColor: SolidColors.getStartScreenBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            //icon
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  height: 64,
                  width: 64,
                  child: const Image(
                      image: AssetImage('assets/icons/chef.png'),
                      fit: BoxFit.contain,
                      width: 45,
                      height: 45,
                  ),
              ),
            ),
            const SizedBox(height: 16,),
            //header text
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: Text('Food for \nEveryone',style: Theme.of(context).textTheme.headline1,),
            ),
            const SizedBox(height: 32,),
            Expanded(
              child: Stack(
                children: [
                  //avators
                  SizedBox(
                    width: double.infinity,
                    height: avatorHeights,
                    child: Stack(
                      children:  [
                        const Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image(image: AssetImage('assets/images/ToyFaces_man.png'),
                              //fit: BoxFit.cover,
                            )
                        ),
                        const Positioned(
                            left: 0,
                            bottom: 0,
                            top: 0,
                            child: Image(image: AssetImage('assets/images/ToyFaces_girl.png',),
                              //fit: BoxFit.cover,

                            )
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            top: avatorHeights /2,
                            child: Container(
                              width: size.width/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin:Alignment.bottomCenter,
                                      end:Alignment.topCenter,
                                      colors: GradiantColors.getStartPageGradientLeft)
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            top: avatorHeights /1.29,
                            child: Container(
                              width: size.width/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin:Alignment.bottomCenter,
                                      end:Alignment.topCenter,
                                      colors: GradiantColors.getStartPageGradientRight)
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  //button
                  Positioned(
                    bottom: 16,
                    left: bodyMargin,
                    right: bodyMargin,
                    child:SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                            return const RootScreen();
                          }));
                        }, child: Text('Get started',
                          style: Theme.of(context).textTheme.bodyText2 ,),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: SolidColors.buttonTextColorRed
                          ),
                        )
                    ), )
                ],
              ),
            ),

        ],
      )
    );
  }
}