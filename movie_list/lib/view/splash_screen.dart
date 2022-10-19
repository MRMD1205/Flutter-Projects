import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/controllers/splash_controller.dart';
import 'package:movie_list/util/color_constants.dart';
import 'package:movie_list/util/dimensions.dart';
import 'package:movie_list/util/images.dart';

class SplashScreen extends StatelessWidget {
  final SplashController productController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: ColorConstants.splashScreenColor,
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Center(
          child: Image.asset(
            Images.splash_image,
            width: 200.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
