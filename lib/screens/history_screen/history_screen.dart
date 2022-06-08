import 'package:flutter/material.dart';
import 'package:food_delivery/constants/icon_with_texts_widget.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    var bodyMargin = size.width * 0.07;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: bodyMargin),
      child: Stack(
        children: [
          const IconWithTextsWidget(
              icon: Icons.add_chart,
              title: 'No history yet',
              subTitle: 'Hit the orange button down below to Create an order'
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: SizedBox(
              height: 64,
                child: ElevatedButton(onPressed: (){}, child: const Text('Start odering'))),
          )
        ],
      ),
    );
  }
}
