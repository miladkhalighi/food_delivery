import 'package:flutter/material.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:food_delivery/views/shared_widgets/icon_with_texts_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bodyMargin = AppDimens.bodyMarginLarge;
    return SizedBox.expand(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(bodyMargin),
            child: SingleChildScrollView(
              child: Column(
                children: const[
                  IconWithTextsWidget(
                      icon: Icons.add_chart,
                      title: 'No history yet',
                      subTitle:
                          'Hit the orange button down below to Create an order'),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: bodyMargin,
            left: bodyMargin,
            right: bodyMargin,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Start odering')),
          )
        ],
      ),
    );
  }
}
