class CartModel {
  List<CartItem> items;
  int itemCount;
  double totalPrice;

  CartModel({this.items, this.itemCount = 0, this.totalPrice = 0.0});
  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = List<CartItem>();
      json['items'].forEach((v) {
        items.add(CartItem.fromJson(v));
      });
    }
    itemCount = json['item_count'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['item_count'] = this.itemCount;
    data['total_price'] = this.totalPrice;
    return data;
  }

  void updateTotalPrice() {
    this.totalPrice = this.items.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity);
  }

  void updateTotalQuantity() {
    this.itemCount = this
        .items
        .fold(0, (previousValue, element) => previousValue + element.quantity);
  }
}

class CartItem {
  String id;
  String title;
  int price;
  String image;
  int quantity;

  CartItem({this.id, this.title, this.price, this.image, this.quantity});
  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    return data;
  }

  void updateQuantity(bool isUpdate) {
    if (isUpdate == true) {
      this.quantity++;
    } else {
      this.quantity--;
    }
  }
}
