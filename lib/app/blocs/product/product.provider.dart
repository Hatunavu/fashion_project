import 'dart:convert';
import 'dart:developer';

import 'package:suplo_project_8_12_2020/app/blocs/product/product.care.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  ProductModel productModel;
  ProductCareModel productCare;
  Future<ProductCareModel> getCareFromApi(String url) async {
    final http.Client httpClient = http.Client();
    try {
      //debugger();
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map;
        productCare = ProductCareModel.fromJson(responseData);
        return productCare;
      }
    } catch (exception) {}
  }

  Future<ProductModel> getDetailFromApi(String productUrl) async {
    // final url =
    //     'https://suplo-fashion.myharavan.com/products/ao-khoac-da-jack-jones-core-biker.js';
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(productUrl);
      if (response.statusCode == 200) {
        ProductModel product = ProductModel.fromJson(
            response.body is Map ? response.body : jsonDecode(response.body));
        // print(product.toJson());
        return product;
      } else {}
    } catch (exception) {}
  }
}
