import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/authentication/views/phone_verification_view.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .3),
                child: Image.asset(
                  'assets/images/firebase.png',
                  height: MediaQuery.of(context).size.height * .15,
                ),
              ),
            ),
            CustomContainer(
              onTap: () {
                controller.googleSignIn();
              },
              height: MediaQuery.of(context).size.height * .07,
              color: AppColors.blue,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                  top: MediaQuery.of(context).size.height * .2,
                  bottom: MediaQuery.of(context).size.height * .02),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/google.jpg',
                    height: MediaQuery.of(context).size.height * .035,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .25),
                    child: CustomText(
                      text: 'Google',
                      style: AppTextStyles.bold.copyWith(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            CustomContainer(
              onTap: () {
                Get.to(PhoneVerificationView());
              },
              height: MediaQuery.of(context).size.height * .07,
              color: AppColors.green,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05,
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05),
              child: Row(
                children: [
                  Icon(
                    Icons.call,
                    size: MediaQuery.of(context).size.height * .035,
                    color: AppColors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .25),
                    child: CustomText(
                      text: 'Phone',
                      style: AppTextStyles.bold.copyWith(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
