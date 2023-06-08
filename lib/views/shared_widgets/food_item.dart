import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/res/dimentions.dart';
import 'package:food_delivery/views/screens/details_screen/item_details_screen.dart';

import '../../res/colors.dart';
import '../../models/item_model.dart';
import '../screens/details_screen/item_details_screen.dart';

class FoodItem extends StatefulWidget {
  final ItemModel item;
  final bool showHero;

  const FoodItem({
    Key? key,
    required this.item,
    this.showHero = true,
  }) : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationCtr;
  late Animation<double> _rotate;
  late Animation<double> _fadeAndScale;

  @override
  void initState() {
    _animationCtr = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _rotate = Tween<double>(begin: 0, end: 1.5).animate(CurvedAnimation(
        parent: _animationCtr,
        curve: const Interval(0, 0.7, curve: Curves.easeIn)));
    _fadeAndScale = CurvedAnimation(
        parent: _animationCtr,
        curve: const Interval(0, 1, curve: Curves.easeIn),
        reverseCurve: Curves.easeOut);

    _animationCtr.forward();
    _animationCtr.addListener(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        //Get.to(()=> ItemDetailsScreen(item: item));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(item: widget.item)));
      },
      child: Stack(
        children: [
          //bg container
          Positioned.fill(
            top: size.height * 0.05,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              //height: widget.width * 2 / 1.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(size.width < 400 ? 30 : 50)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 16)
                  ]),
              child: ScaleTransition(
                scale: _fadeAndScale,
                child: FadeTransition(
                  opacity: _fadeAndScale,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        widget.item.name,
                        style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        presetFontSizes: [
                          textTheme.bodyLarge?.fontSize ?? 34,
                          textTheme.bodyMedium?.fontSize ?? 22,
                          textTheme.bodySmall?.fontSize ?? 16
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.bodyMarginMedium,
                      ),
                      AutoSizeText(
                        widget.item.price,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18, color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 10,
                        stepGranularity: 10,
                      ),
                      SizedBox(
                        height: AppDimens.bodyMarginMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //image
          Positioned(
              top: 0,
              left: AppDimens.bodyMarginSmall,
              right: AppDimens.bodyMarginSmall,
              child: Hero(
                tag: widget.showHero ? widget.item.id : UniqueKey(),
                child: RotationTransition(
                  turns: _rotate,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(widget.item.img),
                              fit: BoxFit.contain),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(1),
                                blurRadius: 16,
                                offset: const Offset(0, 0))
                          ]),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationCtr.dispose();
    super.dispose();
  }
}
