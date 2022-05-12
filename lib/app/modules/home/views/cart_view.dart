import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';
import 'package:products/app/modules/home/views/carts_list_view.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

class CartView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: CustomText(
            text: 'Order Summary',
            style: AppTextStyles.medium
                .copyWith(color: AppColors.greytext, fontSize: 18),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.greytext,
              )),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .65,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .02,
                  right: MediaQuery.of(context).size.width * .02,
                  top: MediaQuery.of(context).size.height * .04),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .01,
                  right: MediaQuery.of(context).size.width * .01,
                  top: MediaQuery.of(context).size.height * .01),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .02),
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                        color: AppColors.darkGreen,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text:
                              '${controller.orderDataList.length} Dishes - ${controller.productCount} Items',
                          style: AppTextStyles.medium
                              .copyWith(color: AppColors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .02),
                      height: MediaQuery.of(context).size.height * .45,
                      child: CartsListView()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .04,
                        right: MediaQuery.of(context).size.width * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Total Amount',
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.black, fontSize: 18),
                        ),
                        Obx(
                          () => CustomText(
                            text:
                                'INR ${controller.totalMount.toStringAsFixed(2)}',
                            style: AppTextStyles.regular
                                .copyWith(color: AppColors.green, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomContainer(
                  onTap: () {
                    controller.placeOrder();
                  },
                  height: MediaQuery.of(context).size.height * .07,
                  color: AppColors.darkGreen,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05,
                      bottom: MediaQuery.of(context).size.height * .02),
                  child: CustomText(
                    text: 'Place Order',
                    style: AppTextStyles.regular.copyWith(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
