import 'package:flutter/material.dart';
import 'package:food_delivery/res/dimentions.dart';

import '../../res/colors.dart';

class IconWithTextsWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subTitle;
  const IconWithTextsWidget(
      {required this.icon,
      required this.title,
      required this.subTitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundScreens,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: const Color(0xFFC7C7C7),
                  size: MediaQuery.of(context).size.height * 0.2,
                )
              : const SizedBox(),
          SizedBox(
            height: AppDimens.bodyMarginLarge,
          ),
          Text(
            title,
            style: textTheme
                .headlineMedium
                ?.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: AppDimens.bodyMarginLarge,
          ),
          Center(
            child: Text(
              subTitle,
              style: textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: AppDimens.bodyMarginLarge,
          ),
        ],
      ),
    );
  }
}
