import 'package:get/get.dart';
import 'package:products/app/modules/home/bindings/home_binding.dart';
import 'package:products/app/modules/home/views/dialog_popup_view.dart';
import 'package:products/app/modules/home/views/home_view.dart';
import 'package:products/app/modules/home/views/products_view.dart';
import 'package:products/models/orderData.dart';

import 'package:products/models/productsResponse.dart';

import 'package:products/networking/operations.dart';
import 'package:products/repository/products_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/sharedPreferenceManager.dart';
import '../../authentication/bindings/authentication_binding.dart';
import '../../authentication/views/authentication_view.dart';

class HomeController extends GetxController {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  List<ProductsResponse> productsList = [];
  List<TableMenuList> tableMenuLists = [];
  List<CategoryDish> categoryDishList = [];
  List<OrderData> orderDataList = [];
  RxBool isLoading = false.obs;
  ProductsRepository productsRepository = ProductsRepository();
  List<bool> selectedCategaryValue = [];
  RxInt previousIndex = 0.obs;
  List<int> countList = [];
  RxBool isVisble = true.obs;
  RxInt productCount = 0.obs;
  Rx<double> totalMount = 0.0.obs;
  String userName = '';
  String uId = '';
  RxInt cartCount = 0.obs;
  //TODO: Implement HomeController

  @override
  void onInit() {
    getuserId();
    fetchData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> fetchData() async {
    isLoading(true);
    productsList = await apiBaseHelper.fetchData();

    tableMenuLists = productsList[0].tableMenuList!;
    selectedValue();
    getSelectedCategory(0);
    isLoading(false);
  }

  void selectedValue() {
    selectedCategaryValue.add(true);
    for (int i = 1; i < tableMenuLists.length; i++) {
      selectedCategaryValue.add(false);
    }
  }

  void onCategorySelected(int index) {
    isLoading(true);
    selectedCategaryValue[previousIndex.value] =
        !selectedCategaryValue[previousIndex.value];
    selectedCategaryValue[index] = !selectedCategaryValue[index];
    previousIndex.value = index;
    getSelectedCategory(index);
    isLoading(false);
  }

  void getSelectedCategory(int index) {
    if (countList != null) {
      countList.clear();
    }
    for (int i = 0; i < tableMenuLists.length; i++) {
      if (tableMenuLists[i].menuCategory ==
          tableMenuLists[index].menuCategory) {
        categoryDishList = tableMenuLists[index].categoryDishes!;
        for (int i = 0; i < categoryDishList.length; i++) {
          countList.add(0);
        }
      }
    }
  }

  void addDishes(int index) {
    isLoading(true);
    categoryDishList[index].count!.value++;
    countList[index]++;
    productCount.value++;
    OrderData orderData = OrderData(
        dishName: categoryDishList[index].dishName,
        calories: categoryDishList[index].dishCalories,
        amount: categoryDishList[index].dishPrice,
        count: countList[index].obs);
    cartCount.value = countList[index];

    if (orderDataList == null || orderDataList.isEmpty) {
      orderDataList.add(orderData);
      totalMount = (totalMount + categoryDishList[index].dishPrice!);
    } else {
      for (int i = 0; i < orderDataList.length; i++) {
        if (orderDataList[i].dishName == categoryDishList[index].dishName) {
          orderDataList.removeAt(i);

          break;
        }
      }
      orderDataList.add(orderData);

      totalMount = (totalMount + categoryDishList[index].dishPrice!);
    }

    isLoading(false);
  }

  void removeDishes(int index) {
    isLoading(true);
    if (orderDataList.isNotEmpty || orderDataList != null) {
      for (int i = 0; i < orderDataList.length; i++) {
        if (orderDataList[i].dishName == orderDataList[index].dishName) {
          countList[i]--;
          if (categoryDishList[index].count!.value == 1) {
            orderDataList.removeAt(i);
          }
          categoryDishList[index].count!.value--;
          totalMount = (totalMount - categoryDishList[index].dishPrice!);
          productCount.value--;

          break;
        }
      }
    }
    isLoading(false);
  }

  void placeOrder() {
    Get.dialog(DialogpopupView(
      description: 'Order placed Scuucessfully',
      text: 'Success',
      submitText: 'Home',
      onSuccess: () {
        Get.offAll(HomeView(), binding: HomeBinding());
      },
    ));
  }

  void signOut() async {
    SharedPreferenceManager.instance.clearDefaults();
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(AuthenticationView(), binding: AuthenticationBinding());
    });
  }

  Future<void> getuserId() async {
    await SharedPreferenceManager.instance.getValueFor('uId').then((value) {
      uId = value;
    });
    await SharedPreferenceManager.instance
        .getValueFor('userName')
        .then((value) {
      userName = value;
    });
  }
}
