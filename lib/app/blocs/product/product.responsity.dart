import 'dart:async';
import 'product.model.dart';
import 'product.provider.dart';

class ProductRepository {
  final productApiProvider = ProductProvider();

  Future<ProductModel> getProductDetail(String productUrl) =>
      productApiProvider.getDetailFromApi(productUrl);
}
