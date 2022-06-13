

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CategoryItem extends StatelessWidget {

  final String name;
  final Function() pressed;
  final bool enabled;
  final double width;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.pressed,
    this.enabled = false,
    this.width = 60.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(name,
              style: enabled ? Theme.of(context).textTheme.bodyText1?.copyWith(color: SolidColors.primaryColor) :
              Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: width,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: enabled ? SolidColors.primaryColor : Colors.transparent,
              boxShadow: enabled ?[
                const BoxShadow(
                    color: SolidColors.primaryColor,
                    offset: Offset(3, 3),
                    blurRadius: 8
                )
              ] : null
            ),
          )
        ],
      ),
    );
  }
}