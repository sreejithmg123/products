import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

class DrawerView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/firebase.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .02,
                      bottom: MediaQuery.of(context).size.height * .02),
                  child: CustomText(
                    text: controller.userName,
                    style: AppTextStyles.regular
                        .copyWith(fontSize: 17, color: AppColors.black),
                  ),
                ),
                CustomText(
                  text: 'ID : ${controller.uId}',
                  style: AppTextStyles.regular
                      .copyWith(fontSize: 17, color: AppColors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .04,
                top: MediaQuery.of(context).size.height * .02),
            child: GestureDetector(
              onTap: () => controller.signOut(),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.signOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.greytext,
                        size: MediaQuery.of(context).size.height * .04,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .06),
                    child: CustomText(
                      text: 'Log Out',
                      style: AppTextStyles.medium
                          .copyWith(color: AppColors.greytext, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
