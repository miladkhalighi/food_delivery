import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "SF-Pro-Rounded-Regular.ttf",
        primarySwatch: Colors.blue,
      ),
      home: const GetStartScreen(),
    );
  }
}




