import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.1;
    return Scaffold(
      appBar: AppBar(
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
            )
        ],
      )
    );
  }
}