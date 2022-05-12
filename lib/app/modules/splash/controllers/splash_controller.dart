import 'dart:async';

import 'package:get/get.dart';

import '../../../../utils/sharedPreferenceManager.dart';
import '../../authentication/bindings/authentication_binding.dart';
import '../../authentication/views/authentication_view.dart';
import '../../home/bindings/home_binding.dart';
import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    isUserLoggedIn();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  isUserLoggedIn() async {
    await Timer(Duration(seconds: 3), () {
      SharedPreferenceManager.instance
          .getBoolValueFor('isUserLoggedIn')
          .then((value) {
        value
            ? Get.to(HomeView(), binding: HomeBinding())
            : Get.to(AuthenticationView(), binding: AuthenticationBinding());
        return value;
      });
    });
  }
}
