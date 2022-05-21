import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'My profile',
              style: textTheme.headline2,
            ),
            const SizedBox(
              height: 32,
            ),
            TitleWithTextButton(
              buttonText: 'change',
              title: 'Personal details',
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 200, //todo : change dynamic size
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 16,),
                      ClipRRect(
                        borderRadius: BorderRadius.all(const Radius.circular(5)),
                        child:  Container(
                          color: SolidColors.primaryColor,
                          child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/ToyFaces_man.png',
                            ),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Milad Khalighi',
                            style: textTheme.bodyText1,
                          ),
                          const SizedBox(height: 8,),
                          Text(
                            'milad.kh4lighi@gmail.com',
                            style:
                                textTheme.bodyText2?.copyWith(color: Colors.grey),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 16,
                          ),
                          Text(
                            '+98 912 000 0000',
                            style:
                                textTheme.bodyText2?.copyWith(color: Colors.grey),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 16,
                          ),
                          Text(
                            'No 15 uti street off ovie palace road effurun delta state',
                            style:
                                textTheme.bodyText2?.copyWith(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithTextButton extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function() onPressed;
  const TitleWithTextButton({
    required this.title,
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyText2,
            ))
      ],
    );
  }
}
