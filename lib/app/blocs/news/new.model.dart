class NewModel {
  String title;
  Paginate paginate;
  List<Articles> articles;

  NewModel({this.title, this.paginate, this.articles});

  NewModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    paginate = json['paginate'] != null
        ? new Paginate.fromJson(json['paginate'])
        : null;
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.paginate != null) {
      data['paginate'] = this.paginate.toJson();
    }
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
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

class Articles {
  String url;
  bool seen;
  String handle;
  String title;
  String description;
  String publishedAt;
  String commentCount;
  String image;

  Articles(
      {this.url,
      this.seen,
      this.handle,
      this.title,
      this.description,
      this.publishedAt,
      this.commentCount,
      this.image});

  Articles.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    seen = json['seen'];
    handle = json['handle'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    commentCount = json['commentCount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['seen'] = this.seen;
    data['handle'] = this.handle;
    data['title'] = this.title;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['commentCount'] = this.commentCount;
    data['image'] = this.image;
    return data;
  }
}
