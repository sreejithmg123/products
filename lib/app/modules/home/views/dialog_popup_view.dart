import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';
import 'package:products/utils/widgets.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/textStyles.dart';

class DialogpopupView extends GetView<HomeController> {
  String? description;
  String? status;
  String? text;
  String? submitText;
  var onSuccess;

  DialogpopupView({
    this.description,
    this.status,
    this.text,
    this.submitText,
    this.onSuccess,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 0,
      child: Wrap(children: [
        MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: status,
                  style: AppTextStyles.bold
                      .copyWith(fontSize: 16, color: AppColors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: text,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.red, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: description,
                  style: AppTextStyles.regular
                      .copyWith(color: AppColors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: onSuccess,
                    child: CustomContainer(
                      width: 135,
                      height: 35,
                      child: CustomText(
                        text: submitText,
                        style: AppTextStyles.bold
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
