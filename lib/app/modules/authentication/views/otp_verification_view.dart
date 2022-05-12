import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:products/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

class OtpVerificationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CustomText(
                      text:
                          'Verify +91 ${controller.mobileNumberController.text}',
                      style: AppTextStyles.medium
                          .copyWith(color: AppColors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .01),
                    child: PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        controller.otp = value;
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 36,
                          fieldWidth: 36,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(3),
                          fieldOuterPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          inactiveColor: AppColors.greytext),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => CustomText(
                        text: controller.errortext.value,
                        style: AppTextStyles.medium
                            .copyWith(color: AppColors.red, fontSize: 20),
                      ),
                    ),
                  ),
                  CustomContainer(
                    onTap: () {
                      controller.verify();
                    },
                    height: MediaQuery.of(context).size.height * .07,
                    color: AppColors.green,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                        top: MediaQuery.of(context).size.height * .02),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05),
                    child: CustomText(
                      text: 'Verify',
                      style: AppTextStyles.bold.copyWith(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
    ));
  }
}
