class WishlistModel {
  int total;
  List<Wishlist> wishlist;
  WishlistModel({this.total, this.wishlist});
  WishlistModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['wishlish'] != null) {
      wishlist = List<Wishlist>();
      json['wishlish'].forEach((item) {
        wishlist.add(Wishlist.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = this.total;
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  String id;
  String title;
  int price;
  int comparePrice;
  String image;
  Wishlist({this.id, this.title, this.price, this.comparePrice, this.image});
  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    comparePrice = json['comparePrice'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['comparePrice'] = this.comparePrice;
    data['image'] = this.image;
    return data;
  }
}
