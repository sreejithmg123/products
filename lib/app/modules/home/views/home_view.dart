import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:products/app/modules/home/views/cart_view.dart';
import 'package:products/app/modules/home/views/drawer_view.dart';
import 'package:products/app/modules/home/views/products_view.dart';
import 'package:products/app/modules/home/views/table_menu_list_view_view.dart';
import 'package:products/utils/colors.dart';
import 'package:products/utils/textStyles.dart';
import 'package:products/utils/widgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
        key: globalKey,
        drawer: DrawerView(),
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: GestureDetector(
              onTap: () => globalKey.currentState!.openDrawer(),
              child: Image.asset(
                'assets/images/drawer_icon.png',
              ),
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(CartView());
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: AppColors.greytext,
                      size: MediaQuery.of(context).size.height * .035,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .065,
                      top: MediaQuery.of(context).size.height * .007),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .035,
                    width: MediaQuery.of(context).size.width * .035,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.red),
                    child: Obx(
                      () => CustomText(
                        text: controller.productCount.value.toString(),
                        style: AppTextStyles.regular.copyWith(fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.red,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          child: TableMenuListViewView()),
                      Container(
                          height: MediaQuery.of(context).size.height * .8,
                          child: ProductsView())
                    ],
                  ),
                ),
        ));
  }
}
