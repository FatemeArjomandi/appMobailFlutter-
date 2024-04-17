import 'package:tech_blog/component/api_constant.dart';

class ArticleListModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  bool? isFavorite;
  String? createdAt;
  ArticleListModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      required this.isFavorite,
      required this.createdAt});

  ArticleListModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiCastant.hostDlUrl + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    isFavorite = element["isFavorite"];
    createdAt = element["created_at"];
  }
}
