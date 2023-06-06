import 'package:flutter/material.dart';

import '../../constants/colors.dart';

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
                  size: 150,
                )
              : const SizedBox(),
          const SizedBox(
            height: 32,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.grey),
              maxLines: 2,
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
