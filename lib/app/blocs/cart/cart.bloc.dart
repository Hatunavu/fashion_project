import 'dart:convert';
import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.model.dart';

class CartBloc {
  CartModel _cart = CartModel();

  final _cartFetchers = BehaviorSubject<CartModel>();

  Stream<CartModel> get cart => _cartFetchers.stream;

  CartBloc() {
    // debugger();
    load();
  }

  updateStream() async {
    // debugger();
    _cart.itemCount = _cart.updateTotalQuantity();
    _cart.totalPrice = _cart.updateTotalPrice();
    _cartFetchers.sink.add(_cart);
    save();
  }

  addToCart(CartItem item, int quantity) {
    // debugger();
    if (_cart != null && _cart.items != null && _cart.items.length > 0) {
      var tempItem =
          _cart.items.where((storedItem) => storedItem.id == item.id);
      if (tempItem != null && tempItem.length > 0) {
        updateItem(item.id, quantity);
      } else {
        addItem(item, quantity);
      }
    } else {
      addItem(item, quantity);
    }
  }

  addItem(CartItem item, int quantity) {
    // debugger();
    item.quantity = 0;
    item.quantity = quantity > 0 ? item.quantity += quantity : 1;
    _cart.items = _cart.items != null ? _cart.items : [];
    _cart.items.insert(0, item);
    updateStream();
  }

  updateItem(String variantId, int quantity) async {
    // debugger();
    var item =
        _cart.items.where((storedItem) => storedItem.id == variantId).first;
    if (quantity > 0) {
      item.quantity += quantity;
    }
    if (quantity < 0) {
      item.quantity = item.quantity > quantity * -1
          ? item.quantity += quantity
          : removeItem(item.id);
    }
    updateStream();
  }

  removeItem(String variantId) {
    // debugger();
    _cart.items.removeWhere((storedItem) => storedItem.id == variantId);
    updateStream();
  }

  load() async {
    // debugger();
    var _prefs = await SharedPreferences.getInstance();
    var tempCart = _prefs.getString("cart");
    if (tempCart != null) {
      _cart = CartModel.fromJson(jsonDecode(tempCart));
      _cartFetchers.sink.add(_cart);
    } else {
      _cart = CartModel(itemCount: 0);
      _cartFetchers.sink.add(_cart);
    }
  }

  save() async {
    // debugger();
    var _prefs = await SharedPreferences.getInstance();
    _prefs.setString("cart", jsonEncode(_cart.toJson()));
  }

  dispose() {
    // debugger();
    save();
    _cartFetchers.close();
  }
}

final cartBloc = CartBloc();
