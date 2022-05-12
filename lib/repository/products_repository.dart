import 'dart:convert';

import 'package:get/get.dart';
import 'package:products/networking/operations.dart';
import 'package:products/networking/response.dart';
import 'package:result_type/result_type.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

class ProductsRepository {
  fetchData() async {
    String responseString = await apiBaseHelper.fetchData();
  }
}
