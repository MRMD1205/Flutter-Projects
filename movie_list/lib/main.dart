import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/util/app_constants.dart';
import 'package:movie_list/util/color_constants.dart';
import 'package:movie_list/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorConstants.appColor,
      ),
      title: AppConstants.APP_NAME,
      home: SplashScreen(),
    );
  }
}
