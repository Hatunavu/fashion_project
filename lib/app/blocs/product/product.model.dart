class ProductModel {
  String id;
  int idHrv;
  String sale;
  String bodyHtml;
  String video;
  String handle;
  String url;
  String title;
  String productType;
  int price;
  String priceFormat;
  int compareAtPrice;
  String compareAtPriceFormat;
  bool available;
  String vendor;
  List<String> tags;
  List<String> images;
  List<Options> options;
  List<Variants> variants;
  List<RelatedProduct> relatedProduct;
  String relatedLink;

  ProductModel(
      {this.id,
      this.idHrv,
      this.sale,
      this.bodyHtml,
      this.video,
      this.handle,
      this.url,
      this.title,
      this.productType,
      this.price,
      this.priceFormat,
      this.compareAtPrice,
      this.compareAtPriceFormat,
      this.available,
      this.vendor,
      this.tags,
      this.images,
      this.options,
      this.variants,
      this.relatedProduct,
      this.relatedLink});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idHrv = json['id_hrv'];
    sale = json['sale'];
    bodyHtml = json['body_html'];
    video = json['video'];
    handle = json['handle'];
    url = json['url'];
    title = json['title'];
    productType = json['product_type'];
    price = json['price'];
    priceFormat = json['price_format'];
    compareAtPrice = json['compare_at_price'];
    compareAtPriceFormat = json['compare_at_price_format'];
    available = json['available'];
    vendor = json['vendor'];
    tags = json['tags'].cast<String>();
    images = json['images'].cast<String>();
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    if (json['related_product'] != null) {
      relatedProduct = new List<RelatedProduct>();
      json['related_product'].forEach((v) {
        relatedProduct.add(new RelatedProduct.fromJson(v));
      });
    }
    relatedLink = json['related_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_hrv'] = this.idHrv;
    data['sale'] = this.sale;
    data['body_html'] = this.bodyHtml;
    data['video'] = this.video;
    data['handle'] = this.handle;
    data['url'] = this.url;
    data['title'] = this.title;
    data['product_type'] = this.productType;
    data['price'] = this.price;
    data['price_format'] = this.priceFormat;
    data['compare_at_price'] = this.compareAtPrice;
    data['compare_at_price_format'] = this.compareAtPriceFormat;
    data['available'] = this.available;
    data['vendor'] = this.vendor;
    data['tags'] = this.tags;
    data['images'] = this.images;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    if (this.relatedProduct != null) {
      data['related_product'] =
          this.relatedProduct.map((v) => v.toJson()).toList();
    }
    data['related_link'] = this.relatedLink;
    return data;
  }
}

class Options {
  String name;
  String position;

  Options({this.name, this.position});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Variants {
  int compareAtPrice;
  String compareAtPriceFormat;
  int id;
  String handle;
  String option1;
  String option2;
  String option3;
  int price;
  String priceFormat;
  String sku;
  String title;
  String vendor;
  int inventoryQuantity;
  String image;
  bool available;
  String sale;

  Variants(
      {this.compareAtPrice,
      this.compareAtPriceFormat,
      this.id,
      this.handle,
      this.option1,
      this.option2,
      this.option3,
      this.price,
      this.priceFormat,
      this.sku,
      this.title,
      this.vendor,
      this.inventoryQuantity,
      this.image,
      this.available,
      this.sale});

  Variants.fromJson(Map<String, dynamic> json) {
    compareAtPrice = json['compare_at_price'];
    compareAtPriceFormat = json['compare_at_price_format'];
    id = json['id'];
    handle = json['handle'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    price = json['price'];
    priceFormat = json['price_format'];
    sku = '';
    title = json['title'];
    vendor = json['vendor'];
    inventoryQuantity = json['inventory_quantity'];
    image = json['image'];
    available = json['available'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compare_at_price'] = this.compareAtPrice;
    data['compare_at_price_format'] = this.compareAtPriceFormat;
    data['id'] = this.id;
    data['handle'] = this.handle;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['price'] = this.price;
    data['price_format'] = this.priceFormat;
    data['sku'] = this.sku;
    data['title'] = this.title;
    data['vendor'] = this.vendor;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['image'] = this.image;
    data['available'] = this.available;
    data['sale'] = this.sale;
    return data;
  }
}

class RelatedProduct {
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

  RelatedProduct(
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

  RelatedProduct.fromJson(Map<String, dynamic> json) {
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
