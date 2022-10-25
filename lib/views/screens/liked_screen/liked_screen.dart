import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/views/shared_widgets/icon_with_texts_widget.dart';
import 'package:food_delivery/controllers/liked_controller.dart';
import 'package:food_delivery/views/shared_widgets/custom_grid_view_with_title.dart';
import 'package:get/get.dart';

class LikedScreen extends GetView<LikedController> {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    var _likeController = Get.find<LikedController>();

    return Obx(() => _likeController.likedList.isEmpty
        ? const IconWithTextsWidget(
            icon: CupertinoIcons.heart,
            title: 'There is not any favorite item',
            subTitle: '',
          )
        : CustomGridViewWithTitle(items: _likeController.likedList,showHero: false,));
  }
}
