import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.provider.dart';

class ProductBloc {
  Future<bool> saveProductSeen(ProductModel payload) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    Products product = Products(
      id: payload.id,
      title: payload.title,
      handle: payload.handle,
      url: payload.url,
      compareAtPrice: payload.compareAtPrice,
      compareAtPriceFormat: payload.compareAtPriceFormat,
      price: payload.price,
      priceFormat: payload.priceFormat,
      available: payload.available,
      sale: payload.sale,
      featuredImage: (payload?.images != null && payload.images.length > 0)
          ? payload.images[0]
          : null,
    );

    if (product.id != null) {
      List<Products> seenProducts = List();
      seenProducts = await loadProductSeen();
      if (seenProducts != null) {
        for (var i = 0; i < seenProducts.length; i++) {
          if (seenProducts[i].id == payload.id) {
            seenProducts.removeAt(i);
          }
        }
        if (seenProducts.length > 29) {
          seenProducts.removeAt(seenProducts.length - 1);
        }
      } else {
        seenProducts = List();
      }
      seenProducts.insert(0, product);
      return await _prefs
          .setString('seen_product', jsonEncode(seenProducts))
          .then((response) {
        return true;
      }).catchError((onError) {
        return false;
      });
    }
    return false;
  }

  Future<List<Products>> loadProductSeen() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var data = _prefs.getString('seen_product');
    List<Products> seenProducts = List();
    if (data != null) {
      jsonDecode(data).forEach((item) {
        seenProducts.add(Products.fromJson(item));
      });
    }
    return seenProducts;
  }
}

final productBloc = ProductBloc();
