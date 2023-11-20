class HashTagModel {
  String titel;
  HashTagModel({required this.titel});
}

class BlogModel {
  String imageUrl;
  String id;
  String profileImageUrl;
  String titel;

  String date;
  String content;
  String views;
  String writer;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.date,
    required this.titel,
    required this.content,
    required this.profileImageUrl,
    required this.views,
    required this.writer,
  });
}
class PotcastModel {
  String imageUrl;
  String titel;
  PotcastModel({required this.imageUrl,required this.titel});
}
