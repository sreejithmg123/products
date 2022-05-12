import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:products/app/modules/authentication/views/otp_verification_view.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

import '../../../../utils/validators.dart';

class PhoneVerificationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CustomText(
                          text: 'Phone Authentication',
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.black, fontSize: 24),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .04,
                              right: MediaQuery.of(context).size.width * .04,
                              top: MediaQuery.of(context).size.height * .05,
                              bottom: MediaQuery.of(context).size.height * .1),
                          child: CustomTextFormField(
                            keyBoardType: TextInputType.phone,
                            maxLength: 10,
                            validator: Validators.mobileNumberValidator,
                            controller: controller.mobileNumberController,
                            label: CustomText(
                              text: 'mobile Number',
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: 12, color: AppColors.black),
                            ),
                            hintText: 'Enter',
                            hintStyle: AppTextStyles.regular
                                .copyWith(color: AppColors.black, fontSize: 12),
                          )),
                      CustomContainer(
                        onTap: () {
                          controller.verifyPhone();
                        },
                        height: MediaQuery.of(context).size.height * .07,
                        color: AppColors.green,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child: CustomText(
                          text: 'Continue',
                          style: AppTextStyles.bold.copyWith(fontSize: 18),
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
