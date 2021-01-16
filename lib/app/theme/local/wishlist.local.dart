import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/wishlist/wishlist.model.dart';

class WishlistLocal {
  Future<bool> saveWishlist(Products payload, bool isWish) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Products wishlist = Products(
      id: payload.id,
      firstVariant: payload.firstVariant,
      title: payload.title,
      featuredImage: payload.featuredImage,
      handle: payload.handle,
      url: payload.url,
      priceFormat: payload.priceFormat,
      price: payload.price,
      compareAtPrice: payload.compareAtPrice,
      compareAtPriceFormat: payload.compareAtPriceFormat,
      available: payload.available,
      sale: payload.sale,
    );

    CollectionModel wish = CollectionModel();
    // debugger();
    wish = await loadWishlist();
    if (wish.products != null) {
      for (var i = 0; i < wish.products.length; i++) {
        if (wish.products[i].id == payload.id) {
          wish.products.removeAt(i);
        }
      }
      if (isWish == true) {
        wish.products.insert(0, wishlist);
      }
    } else {
      wish.products = [];
      wish.products.insert(0, wishlist);
    }

    return await prefs.setString('wishlist', jsonEncode(wish)).then((value) {
      return true;
    }).catchError((onError) {
      return false;
    });
  }

  Future<CollectionModel> loadWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('wishlist');
    CollectionModel wish = CollectionModel();
    if (data != null) {
      wish = CollectionModel.fromJson(jsonDecode(data));
    }
    return wish;
  }
}
