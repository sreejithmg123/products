import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';
import 'package:products/app/modules/home/views/cart_view.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/textStyles.dart';
import '../../../../utils/widgets.dart';

class CartsListView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.orderDataList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .04,
              right: MediaQuery.of(context).size.width * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: CustomText(
                      textAlign: TextAlign.start,
                      text: controller.orderDataList[index].dishName,
                      style: AppTextStyles.medium
                          .copyWith(fontSize: 15, color: AppColors.black),
                    ),
                  ),
                  Visibility(
                    visible: controller.isVisble.value,
                    child: CustomContainer(
                      width: MediaQuery.of(context).size.width * .34,
                      color: AppColors.darkGreen,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (() => controller.removeDishes(index)),
                            child: CustomText(
                              text: '-',
                              style: AppTextStyles.medium.copyWith(
                                  color: AppColors.white, fontSize: 35),
                            ),
                          ),
                          Obx(
                            () => CustomText(
                              text: controller
                                  .categoryDishList[index].count!.value
                                  .toString(),
                              style: AppTextStyles.medium.copyWith(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.addDishes(index);
                            },
                            child: CustomText(
                              text: '+',
                              style: AppTextStyles.medium.copyWith(
                                  color: AppColors.white, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => CustomText(
                      text:
                          'INR ${(controller.categoryDishList[index].dishPrice! * controller.categoryDishList[index].count!.value).toStringAsFixed(2)}',
                      style: AppTextStyles.medium
                          .copyWith(fontSize: 15, color: AppColors.black),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .02,
                    bottom: MediaQuery.of(context).size.height * .01,
                    left: MediaQuery.of(context).size.width * .028),
                child: CustomText(
                  text:
                      'INR ${controller.orderDataList[index].amount!.toStringAsFixed(2)}',
                  style: AppTextStyles.medium
                      .copyWith(fontSize: 15, color: AppColors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .028,
                    bottom: MediaQuery.of(context).size.height * .03),
                child: CustomText(
                  text: '${controller.orderDataList[index].calories} Calories',
                  style: AppTextStyles.medium
                      .copyWith(fontSize: 15, color: AppColors.black),
                ),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ),
        );
      },
    );
  }
}
