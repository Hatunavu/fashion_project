import 'dart:convert';
import 'dart:developer';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/wishlist/wishlist.model.dart';

class WishlistBloc {
  CollectionModel wishlist = CollectionModel();
  final wishFetch = BehaviorSubject<CollectionModel>();
  Stream<CollectionModel> get wish => wishFetch.stream;

  WishlistBloc() {
    load();
  }

  updateStream() async {
    // debugger();
    wishFetch.sink.add(wishlist);
    save();
  }

  addWish(Products wish, bool isWish) {
    // debugger();
    if (wishlist != null &&
        wishlist.products != null &&
        wishlist.products.length > 0) {
      for (var i = 0; i < wishlist.products.length; i++) {
        if (wishlist.products[i].id == wish.id) {
          wishlist.products.removeAt(i);
        }
      }
      if (isWish == true) {
        wishlist.products.insert(0, wish);
      }
    } else {
      wishlist.products = [];
      wishlist.products.insert(0, wish);
    }
    updateStream();
  }

  removeWish(String id) {
    wishlist.products.removeWhere((storedWish) => storedWish.id == id);
    updateStream();
  }

  bool isProductInWishlist(String id) {
    // debugger();
    bool hasInWishlist = false;
    try {
      if (wishlist != null && wishlist?.products != null) {
        for (var i = 0; i < wishlist.products.length; i++) {
          if (wishlist.products[i] != null && wishlist.products[i].id == id) {
            hasInWishlist = true;
            break;
          }
        }
      }
    } catch (e) {
      print(e);
    } finally {}
    return hasInWishlist;
  }

  load() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var tempWish = _prefs.getString('wish');
    if (tempWish != null) {
      wishlist = CollectionModel.fromJson(jsonDecode(tempWish));
      wishFetch.sink.add(wishlist);
    }
    return wishlist;
  }

  save() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('wish', jsonEncode(wishlist.toJson()));
  }

  dispose() {
    save();
    wishFetch.close();
  }
}

final wishBloc = WishlistBloc();
