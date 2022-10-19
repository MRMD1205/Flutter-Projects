import 'dart:async';

import 'package:get/get.dart';
import 'package:movie_list/controllers/base_controller.dart';
import 'package:movie_list/util/dimensions.dart';
import 'package:movie_list/view/dashboard.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    loginCheck();
    super.onInit();
  }

  void loginCheck() async {
    var _duration = new Duration(
      seconds: Dimensions.screenLoadTime,
    );
    Timer(_duration, () async {
      Get.off(Dashboard());
    });
  }
}
