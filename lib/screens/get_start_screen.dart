import 'package:flutter/cupertino.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(image: AssetImage('assets/images/ToyFaces_girl.png')),
                Image(image: AssetImage('assets/images/ToyFaces_man.png')),
              ],
            ),
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