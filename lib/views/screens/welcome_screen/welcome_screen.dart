import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/res/style.dart';
import 'package:food_delivery/root_navigator.dart';
import 'package:food_delivery/res/dimentions.dart';

import '../../../constants/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _animCtr;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animCtr =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {})
          ..forward();
    _animOffset = Tween<Offset>(
            begin: const Offset(1.5, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(
            parent: _animCtr,
            curve: const Interval(0.7, 1, curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: AppColors.welcomeScreenBackground,
        body: SafeArea(
          child: Stack(
            children: [
              //header
              Positioned(
                top: AppDimens.bodyMarginLarge,
                left: AppDimens.bodyMarginLarge,
                right: AppDimens.bodyMarginLarge,
                child: header(),
              ),
              //avators
              Positioned(
                bottom: size.height * 0.02,
                right: 0,
                left: 0,
                child: avatars(),
              ),
              // Bottom Linear Gradient
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: AppColors.avatorsGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
              ),

              //button
              Positioned(
                  bottom: AppDimens.bodyMarginSmall,
                  left: AppDimens.bodyMarginMedium,
                  right: AppDimens.bodyMarginMedium,
                  child: SlideTransition(
                    position: _animOffset,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RootNavigator()));
                      },
                      child: Text(
                        'Get started',
                        style: textTheme.labelSmall,
                      ),
                      style: AppStyle.secondaryButton,
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget avatars() {
    return SizedBox(
      width: double.infinity,
      height: Dimension.size.height / 1.9,
      child: Stack(
        children: const [
          Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage('assets/images/ToyFaces_man.png'),
                fit: BoxFit.cover,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                  'assets/images/ToyFaces_girl.png',
                ),
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

  //header includes icon and title
  Widget header() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //icon
        Padding(
            padding: EdgeInsets.only(left: AppDimens.bodyMarginMedium),
            child: CircleAvatar(
              radius: size.height * 0.05,
              backgroundColor: Colors.white,
              backgroundImage: Image.asset('assets/icons/chef.png').image,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        //header text
        TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Opacity(
              opacity: value,
              child: Padding(
                padding: EdgeInsets.only(left: AppDimens.bodyMarginMedium),
                child: Text(
                  'Food for Everyone',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            );
          },
          curve: Curves.easeIn,
        ),
        //const SizedBox(height: Dimension.bodyMargin*2,),
      ],
    );
  }
}
