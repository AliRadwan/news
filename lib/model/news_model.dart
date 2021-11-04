class Articles {
  String? id;
  String? image;
  String? title;
  String? content;
  String? createdAt;

  Articles({this.id, this.image, this.title, this.content, this.createdAt});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
  }
}

class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    articles =
        (json['items'] as List).map((e) => Articles.fromJson(e)).toList();
  }
}
