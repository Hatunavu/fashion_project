class MenuModel {
  List<Menu> menu;

  MenuModel({this.menu});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = new List<Menu>();
      json['menu'].forEach((v) {
        menu.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  String title;
  String link;
  String collectionImage;
  List<SubLink> subLink;

  Menu({this.title, this.link, this.collectionImage, this.subLink});

  Menu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    collectionImage = json['collection_image'];
    if (json['sub_link'] != null) {
      subLink = new List<SubLink>();
      json['sub_link'].forEach((v) {
        subLink.add(new SubLink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['collection_image'] = this.collectionImage;
    if (this.subLink != null) {
      data['sub_link'] = this.subLink.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubLink {
  String title;
  String link;
  String collectionImage;

  SubLink({this.title, this.link, this.collectionImage});

  SubLink.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    collectionImage = json['collection_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['collection_image'] = this.collectionImage;
    return data;
  }
}
