import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/screens/get_start_screen/get_start_screen.dart';
import 'package:food_delivery/screens/profile_screen/profile_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: SolidColors.backgroundScreens,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: SolidColors.backgroundScreens,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: SolidColors.statusBarColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: SolidColors.systemNavBarColor,
            systemNavigationBarIconBrightness: Brightness.dark
          )
        ),
        fontFamily: "SF",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'SF',
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          headline2: TextStyle(
            fontFamily: 'SF',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          bodyText1: TextStyle(
            fontFamily: 'SF',
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle(
            fontFamily: 'SF',
            fontSize: 14,
            color: SolidColors.buttonTextColorRed
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: SolidColors.primaryColor,
            onPrimary: SolidColors.buttonTextColorWhite,
            shape: const StadiumBorder(),
          ),
        ),
        primarySwatch: Colors.red,
      ),
      home: const GetStartScreen(),
    );
  }
}




