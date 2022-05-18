import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/screens/get_start_screen.dart';

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
        fontFamily: "SF",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'SF',
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
        primarySwatch: Colors.red,
      ),
      home: const GetStartScreen(),
    );
  }
}




