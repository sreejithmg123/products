import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:products/models/productsResponse.dart';

import 'app_exception.dart';

class ApiBaseHelper {
  Future fetchData() async {
    var responseJson;
    try {
      final response = await http
          .post(Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'));
      responseJson = _returnResponse(response);
      if (response.statusCode == 200) {
        print(response.body);

        var jsonData = jsonDecode(response.body);
        return productsFromJson(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return response.body.toString();
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
