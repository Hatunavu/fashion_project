import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.model.dart';

class CartLocal {
  Future<bool> saveCart(
      CartItem payload, bool isChangeAmount, bool isDel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CartItem item = CartItem(
        id: payload.id,
        title: payload.title,
        image: payload.image,
        price: payload.price,
        quantity: 1);

    CartModel cartModel = CartModel();
    // debugger();
    cartModel = await loadCart();
    if (cartModel.items != null &&
        cartModel.items.indexWhere((element) => element.id == payload.id) !=
            -1) {
      if (isDel == false) {
        for (int i = 0; i < cartModel.items.length; i++) {
          if (cartModel.items[i].id == payload.id) {
            if (isChangeAmount) {
              cartModel.items[i].updateQuantity(true);
            } else {
              if (cartModel.items[i].quantity <= 1) {
                cartModel.items.removeAt(i);
              } else {
                cartModel.items[i].updateQuantity(false);
              }
            }
          }
        }
      } else {
        cartModel.items.removeAt(
            cartModel.items.indexWhere((element) => element.id == payload.id));
      }
    } else if (cartModel.items != null &&
        cartModel.items.indexWhere((element) => element.id == payload.id) ==
            -1) {
      cartModel.items.insert(0, item);
    } else {
      cartModel.items = [];
      cartModel.items.insert(0, item);
    }

    cartModel.updateTotalQuantity();
    cartModel.updateTotalPrice();
    return await prefs.setString('cart', jsonEncode(cartModel)).then((value) {
      return true;
    }).catchError((onError) {
      return false;
    });
  }

  Future<CartModel> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cart');
    CartModel cartModel = CartModel();
    if (data != null) {
      cartModel = CartModel.fromJson(jsonDecode(data));
    }
    return cartModel;
  }
}
