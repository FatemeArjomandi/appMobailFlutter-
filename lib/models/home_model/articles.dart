class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  ArticleModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.author,
      required this.view,
      required this.status,
      required this.createdAt});

  ArticleModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
    catId = element["cat_id"];
    author = element["cat_name"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
