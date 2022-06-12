import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:get/get.dart';

import '../../constants/icon_with_texts_widget.dart';
import '../home_screen/components/food_item.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.07;

    return SafeArea(
        child: Scaffold(
          body: Obx(
              ()=> buildBody(context, bodyMargin)),
        )
    );
  }


  Widget buildBody(BuildContext context, double bodyMargin) {
    var _likeController = Get.find<LikedController>();

    return _likeController.likedList.isEmpty ?
    const IconWithTextsWidget(
      icon: CupertinoIcons.heart,
      title: 'There is not any favorite item',
      subTitle: '',
    ) : Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16,),
            Text('Found ${_likeController.likedList.length} results',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24),),
            buildGridView(bodyMargin),
          ],
        ),
      ),
    );
  }


  GridView buildGridView(double bodyMargin) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: bodyMargin,
      mainAxisSpacing: bodyMargin,
      childAspectRatio: 1/1.6,
      padding: EdgeInsets.all(bodyMargin),
      physics: const BouncingScrollPhysics(),
      children: List.generate(Get.find<LikedController>().likedList.length, (index) =>
          FoodItem(
            item: Get.find<LikedController>().likedList[index],
          )
      ),
    );
  }

}
