import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';

class FoodItem extends StatelessWidget {
  final double width;
  final String img;
  final String name;
  final String price;

  const FoodItem({Key? key,this.width=150,
    required this.img,
    required this.name,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width * 1.55,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: width * 2 / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 16
                    )
                  ]
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 26),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: width * 0.1,),
                  Text(price,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,color: SolidColors.primaryColor),),
                  SizedBox(height: width * 0.15,)
                ],
              ),
            ),
          ),
          //image
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: width - width * 0.2,
                height: width - width * 0.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 32,
                          offset: const Offset(0, 16)
                      )
                    ]
                ),
              )
          )
        ],
      ),
    );
  }
}