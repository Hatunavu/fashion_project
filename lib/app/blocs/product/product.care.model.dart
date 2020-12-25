class ProductCareModel {
  String id;
  String title;
  String image;
  List<Products> products;
  Filter filter;
  Paginate paginate;

  ProductCareModel(
      {this.id,
      this.title,
      this.image,
      this.products,
      this.filter,
      this.paginate});

  ProductCareModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    filter =
        json['filter'] != null ? new Filter.fromJson(json['filter']) : null;
    paginate = json['paginate'] != null
        ? new Paginate.fromJson(json['paginate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['filter'] = this.filter.toJson();
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate.toJson();
    }
    return data;
  }
}

class Products {
  String id;
  int firstVariant;
  String title;
  String featuredImage;
  String handle;
  String url;
  int compareAtPrice;
  String compareAtPriceFormat;
  int price;
  String priceFormat;
  bool available;
  String sale;

  Products(
      {this.id,
      this.firstVariant,
      this.title,
      this.featuredImage,
      this.handle,
      this.url,
      this.compareAtPrice,
      this.compareAtPriceFormat,
      this.price,
      this.priceFormat,
      this.available,
      this.sale});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstVariant = json['first_variant'];
    title = json['title'];
    featuredImage = json['featured_image'];
    handle = json['handle'];
    url = json['url'];
    compareAtPrice = json['compare_at_price'];
    compareAtPriceFormat = json['compare_at_price_format'];
    price = json['price'];
    priceFormat = json['price_format'];
    available = json['available'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_variant'] = this.firstVariant;
    data['title'] = this.title;
    data['featured_image'] = this.featuredImage;
    data['handle'] = this.handle;
    data['url'] = this.url;
    data['compare_at_price'] = this.compareAtPrice;
    data['compare_at_price_format'] = this.compareAtPriceFormat;
    data['price'] = this.price;
    data['price_format'] = this.priceFormat;
    data['available'] = this.available;
    data['sale'] = this.sale;
    return data;
  }
}

class Filter {
  Vendors vendors;
  Vendors types;

  Filter({this.vendors, this.types});

  Filter.fromJson(Map<String, dynamic> json) {
    vendors =
        json['vendors'] != null ? new Vendors.fromJson(json['vendors']) : null;
    types = json['types'] != null ? new Vendors.fromJson(json['types']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vendors != null) {
      data['vendors'] = this.vendors.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types.toJson();
    }
    return data;
  }
}

class Vendors {
  bool enable;
  String title;
  List<Items> items;

  Vendors({this.enable, this.title, this.items});

  Vendors.fromJson(Map<String, dynamic> json) {
    enable = json['enable'];
    title = json['title'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable'] = this.enable;
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String title;
  String value;

  Items({this.title, this.value});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class Paginate {
  int pages;
  int items;
  int currentPage;
  bool hasNext;

  Paginate({this.pages, this.items, this.currentPage, this.hasNext});

  Paginate.fromJson(Map<String, dynamic> json) {
    pages = json['pages'];
    items = json['items'];
    currentPage = json['current_page'];
    hasNext = json['hasNext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pages'] = this.pages;
    data['items'] = this.items;
    data['current_page'] = this.currentPage;
    data['hasNext'] = this.hasNext;
    return data;
  }
}
