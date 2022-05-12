import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/controllers/home_controller.dart';

import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

class TableMenuListViewView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.tableMenuLists.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onCategorySelected(index);
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02),
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  CustomText(
                    text: (controller.tableMenuLists[index].menuCategory),
                    style: AppTextStyles.medium.copyWith(color: AppColors.red),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .01),
                    child: Divider(
                      thickness: 2,
                      color: controller.selectedCategaryValue[index]
                          ? AppColors.red
                          : AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
