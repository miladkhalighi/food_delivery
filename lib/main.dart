import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/bindings/bindings.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/views/screens/get_start_screen/get_start_screen.dart';
import 'package:get/get.dart';

void main() async{
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
      theme: buildThemeData(context),
      home: const GetStartScreen(),
    );
  }

  ThemeData buildThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: SolidColors.backgroundScreens,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: SolidColors.backgroundScreens,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: SolidColors.getStartScreenBackground,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: SolidColors.getStartScreenBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: SolidColors.getStartScreenBackground,
        )
      ),
      fontFamily: "SF",
      textTheme: TextTheme(
        headline1: const TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        headline2: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        headline3: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        bodyText1: TextStyle(
          fontSize: 17,
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold
        ),
        bodyText2: const TextStyle(
          fontSize: 14,
          color: SolidColors.buttonTextColorPrimary
        ),
        button: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(

          minimumSize: Size(Get.size.width * 0.7, 64),
          primary: SolidColors.primaryColor,
          onPrimary: SolidColors.buttonTextColorSecondary,
          shape: const StadiumBorder(),
          textStyle: Theme.of(context).textTheme.button
        ),
      ),
      primarySwatch: Colors.red,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }
      )
    );
  }
}




