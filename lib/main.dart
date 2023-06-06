import 'package:flutter/material.dart';
import 'package:food_delivery/bindings/bindings.dart';
import 'package:food_delivery/res/theme.dart';
import 'package:food_delivery/views/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const WelcomeScreen(),
    );
  }

}
