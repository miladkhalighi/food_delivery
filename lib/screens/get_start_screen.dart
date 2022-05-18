import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.getStartScreenBackground,
      body: Column(
        children: [
            const Image(image: AssetImage('assets/images/chef.png')),
            const Text('test')
        ],
      )
    );
  }
}