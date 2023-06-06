import 'package:flutter/material.dart';
import 'package:food_delivery/views/screens/details_screen/item_details_screen.dart';

import '../../constants/colors.dart';
import '../../models/item_model.dart';

class FoodItem extends StatefulWidget {
  final double width;
  final ItemModel item;
  final bool showHero;

  const FoodItem({
    Key? key,
    this.width = 150,
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
    return InkWell(
      onTap: () {
        //Get.to(()=> ItemDetailsScreen(item: item));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(item: widget.item)));
      },
      child: SizedBox(
          width: widget.width,
          height: widget.width * 1.55,
          child: Stack(
            children: [
              Positioned(
                top: widget.width / 4,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  height: widget.width * 2 / 1.5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
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
                          Text(
                            widget.item.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 22),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: widget.width * 0.1,
                          ),
                          Text(
                            widget.item.price,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: widget.width * 0.15,
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
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: widget.showHero ? widget.item.id : UniqueKey(),
                    child: RotationTransition(
                      turns: _rotate,
                      child: Container(
                        width: widget.width - widget.width * 0.15,
                        height: widget.width - widget.width * 0.15,
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
                  ))
            ],
          )),
    );
  }

  @override
  void dispose() {
    _animationCtr.dispose();
    super.dispose();
  }
}
