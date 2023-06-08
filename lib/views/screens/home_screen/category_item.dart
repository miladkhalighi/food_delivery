import 'package:flutter/material.dart';
import 'package:food_delivery/res/colors.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Function() pressed;
  final bool enabled;
  final double width;

  const CategoryItem(
      {Key? key,
      required this.name,
      required this.pressed,
      this.enabled = false,
      this.width = 60.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryColor.withOpacity(0.1),
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      onTap: pressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              style: enabled
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.primaryColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedContainer(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250),
            width: width,
            height: 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: enabled ? AppColors.primaryColor : Colors.transparent,
                boxShadow: [
                  BoxShadow(
                      color:
                          enabled ? AppColors.primaryColor : Colors.transparent,
                      offset: const Offset(3, 3),
                      blurRadius: 12)
                ]),
          )
        ],
      ),
    );
  }
}
