import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    var avatorHeights = size.height/2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: SolidColors.getStartScreenBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                  height: 64,
                  width: 64,
                  child: const Image(image: AssetImage('assets/images/chef.png'))),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: Text('Food for \nEveryone',style: Theme.of(context).textTheme.headline1,),
            ),
            const SizedBox(height: 48,),
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
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyMargin),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                  child: ElevatedButton(onPressed: (){}, child: Text('Get started',
                    style: Theme.of(context).textTheme.bodyText2 ,))
              ),
            ),
            const SizedBox(height: 16,),

        ],
      )
    );
  }
}