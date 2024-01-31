class CategorisModel {
  String? id;
  String? title;
  CategorisModel({required this.id, required this.title});

  CategorisModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
