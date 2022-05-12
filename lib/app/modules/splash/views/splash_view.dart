import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/utils/colors.dart';

import '../../../../utils/textStyles.dart';
import '../../../../utils/widgets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomText(
        text: "PRODUCTS",
        style:
            AppTextStyles.italic.copyWith(fontSize: 45, color: AppColors.black),
      )),
    );
  }
}
