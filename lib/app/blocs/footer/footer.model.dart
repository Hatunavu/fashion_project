class FooterModel {
  BgImage bgImage;
  Information information;
  Menu menu;
  Subcribe subcribe;
  Gallery gallery;
  String copyrightinfor;
  List<Copyrightmenu> copyrightmenu;

  FooterModel(
      {this.bgImage,
      this.information,
      this.menu,
      this.subcribe,
      this.gallery,
      this.copyrightinfor,
      this.copyrightmenu});

  FooterModel.fromJson(Map<String, dynamic> json) {
    bgImage = json['bg_image'] != null
        ? new BgImage.fromJson(json['bg_image'])
        : null;
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
    subcribe = json['subcribe'] != null
        ? new Subcribe.fromJson(json['subcribe'])
        : null;
    gallery =
        json['gallery'] != null ? new Gallery.fromJson(json['gallery']) : null;
    copyrightinfor = json['copyrightinfor'];
    if (json['copyrightmenu'] != null) {
      copyrightmenu = new List<Copyrightmenu>();
      json['copyrightmenu'].forEach((v) {
        copyrightmenu.add(new Copyrightmenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bgImage != null) {
      data['bg_image'] = this.bgImage.toJson();
    }
    if (this.information != null) {
      data['information'] = this.information.toJson();
    }
    if (this.menu != null) {
      data['menu'] = this.menu.toJson();
    }
    if (this.subcribe != null) {
      data['subcribe'] = this.subcribe.toJson();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery.toJson();
    }
    data['copyrightinfor'] = this.copyrightinfor;
    if (this.copyrightmenu != null) {
      data['copyrightmenu'] =
          this.copyrightmenu.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BgImage {
  bool enable;
  String image;

  BgImage({this.enable, this.image});

  BgImage.fromJson(Map<String, dynamic> json) {
    enable = json['enable'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable'] = this.enable;
    data['image'] = this.image;
    return data;
  }
}

class Information {
  bool enableLogo;
  String imageLogo;
  String address;
  String phoneNumber;
  String email;

  Information(
      {this.enableLogo,
      this.imageLogo,
      this.address,
      this.phoneNumber,
      this.email});

  Information.fromJson(Map<String, dynamic> json) {
    enableLogo = json['enable_logo'];
    imageLogo = json['image_logo'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable_logo'] = this.enableLogo;
    data['image_logo'] = this.imageLogo;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }
}

class Menu {
  String menuTitle;
  List<MenuLink> menuLink;

  Menu({this.menuTitle, this.menuLink});

  Menu.fromJson(Map<String, dynamic> json) {
    menuTitle = json['menu_title'];
    if (json['menu_link'] != null) {
      menuLink = new List<MenuLink>();
      json['menu_link'].forEach((v) {
        menuLink.add(new MenuLink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_title'] = this.menuTitle;
    if (this.menuLink != null) {
      data['menu_link'] = this.menuLink.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuLink {
  String linkTitle;
  String linkUrl;

  MenuLink({this.linkTitle, this.linkUrl});

  MenuLink.fromJson(Map<String, dynamic> json) {
    linkTitle = json['link_title'];
    linkUrl = json['link_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link_title'] = this.linkTitle;
    data['link_url'] = this.linkUrl;
    return data;
  }
}

class Subcribe {
  String title;
  String description;
  String placeholder;

  Subcribe({this.title, this.description, this.placeholder});

  Subcribe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    placeholder = json['placeholder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class Gallery {
  String title;
  List<Image> image;

  Gallery({this.title, this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['image'] != null) {
      image = new List<Image>();
      json['image'].forEach((v) {
        image.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  bool enable;
  String imgMain;
  String imgThumb;
  String imgAlt;

  Image({this.enable, this.imgMain, this.imgThumb, this.imgAlt});

  Image.fromJson(Map<String, dynamic> json) {
    enable = json['enable'];
    imgMain = json['img_main'];
    imgThumb = json['img_thumb'];
    imgAlt = json['img_alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable'] = this.enable;
    data['img_main'] = this.imgMain;
    data['img_thumb'] = this.imgThumb;
    data['img_alt'] = this.imgAlt;
    return data;
  }
}

class Copyrightmenu {
  String title;
  String url;

  Copyrightmenu({this.title, this.url});

  Copyrightmenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
