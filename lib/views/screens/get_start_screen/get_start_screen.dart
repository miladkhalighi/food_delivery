import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/root_navigator.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen>
    with SingleTickerProviderStateMixin {
  final SystemUiOverlayStyle _systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: SolidColors.getStartScreenBackground,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.getStartScreenBackground,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: SolidColors.getStartScreenBackground,
  );
  var avatorHeights = Dimension.size.height / 2;

  late AnimationController _animCtr;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animCtr =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {})
          ..forward();
    _animOffset = Tween<Offset>(begin: const Offset(1.5, 0.0),end: const Offset(0.0, 0.0)).animate(CurvedAnimation(parent: _animCtr,
        curve: const Interval(0.7, 1,curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _systemUiOverlayStyle,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: SolidColors.getStartScreenBackground,
          ),
          backgroundColor: SolidColors.getStartScreenBackground,
          body: body()),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: header()),
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              avatars(),
              //button
              Positioned(
                bottom: Dimension.bodyMargin,
                left: Dimension.bodyMargin,
                right: Dimension.bodyMargin,
                child: button(),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget button() {
    return SlideTransition(
      position: _animOffset,
      child: SizedBox(
          width: double.infinity,
          height: 64,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RootNavigator()));
            },
            child: Text(
              'Get started',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: SolidColors.buttonTextColorPrimary),
          )),
    );
  }

  Widget avatars() {
    return SizedBox(
      width: double.infinity,
      height: avatorHeights,
      child: Stack(
        children: [
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage('assets/images/ToyFaces_man.png'),
                //fit: BoxFit.cover,
              )),
          const Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Image(
                image: AssetImage(
                  'assets/images/ToyFaces_girl.png',
                ),
                //fit: BoxFit.cover,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              top: avatorHeights / 2,
              child: Container(
                width: Dimension.size.width / 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: GradiantColors.getStartPageGradientLeft)),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              top: avatorHeights / 1.29,
              child: Container(
                width: Dimension.size.width / 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: GradiantColors.getStartPageGradientRight)),
              )),
        ],
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //icon
        Padding(
          padding: const EdgeInsets.only(left: Dimension.bodyMargin),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            height: 70,
            width: 70,
            child: const Image(
              image: AssetImage('assets/icons/chef.png'),
              fit: BoxFit.contain,
              width: 45,
              height: 45,
            ),
          ),
        ),
        const SizedBox(
          height: Dimension.bodyMargin,
        ),
        //header text
        TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Opacity(
              opacity: value,
              child: Padding(
                padding: const EdgeInsets.only(left: Dimension.bodyMargin),
                child: Text(
                  'Food for \nEveryone',
                  style: Theme.of(context).textTheme.headline1,
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
