import 'package:get/get.dart';

class OrderData {
  String? dishName;
  double? calories;
  Rx<int>? count;
  double? amount;
  OrderData({this.dishName, this.calories, this.count, this.amount});
}
