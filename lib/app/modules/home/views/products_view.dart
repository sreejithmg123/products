import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

class ProductsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: controller.categoryDishList.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.height * .02),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: controller.categoryDishList[index].dishName,
                        style: AppTextStyles.bold
                            .copyWith(fontSize: 18, color: AppColors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01,
                          bottom: MediaQuery.of(context).size.height * .04),
                      child: Row(
                        children: [
                          CustomText(
                            text:
                                'INR ${controller.categoryDishList[index].dishPrice}',
                            style: AppTextStyles.bold
                                .copyWith(fontSize: 16, color: AppColors.black),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text:
                                    '${controller.categoryDishList[index].dishCalories!.toStringAsFixed(0)} Calories',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 16, color: AppColors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03),
                            child: Image.network(
                              'https://cdn.corporatefinanceinstitute.com/assets/product-mix3.jpeg',
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * .2,
                          bottom: MediaQuery.of(context).size.height * .03),
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text:
                            controller.categoryDishList[index].dishDescription,
                        style: AppTextStyles.regular
                            .copyWith(fontSize: 14, color: AppColors.greytext),
                      ),
                    ),
                    Visibility(
                      visible: controller.isVisble.value,
                      child: CustomContainer(
                        width: MediaQuery.of(context).size.width * .3,
                        color: AppColors.green,
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
                              () => Visibility(
                                visible: controller.isVisble.value,
                                child: CustomText(
                                  text: controller.countList != null
                                      ? controller.countList[index].toString()
                                      : '0',
                                  style: AppTextStyles.medium.copyWith(
                                      color: AppColors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.addDishes(index),
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02,
                          bottom: MediaQuery.of(context).size.height * .02),
                      child: controller
                              .categoryDishList[index].addonCat!.isNotEmpty
                          ? CustomText(
                              text: 'Customizations Available',
                              style: AppTextStyles.regular
                                  .copyWith(color: AppColors.red, fontSize: 16),
                            )
                          : SizedBox(),
                    )
                  ],
                ),
              ]),
            ),
            Divider(
              thickness: 1,
            )
          ],
        );
      }),
    ));
  }
}
