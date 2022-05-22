import 'package:flutter/material.dart';

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