import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/home_model/tags.dart';
import 'package:tech_blog/services/dio_service.dart';

import '../models/article_model/article_single_models/info_model.dart';
import '../models/article_model/article_single_models/related_model.dart';

class ArticleSingleController extends GetxController {
  RxInt id = RxInt(0);
  bool isFavorite = false;
  List<RelatedModel> relatedArtical = [];
  RxList<TagsModel> tagsArticle = RxList();
  Rx<InfoModel> infoArticle = InfoModel().obs;

  getArticleInfo() async {
    //TODO userId is hard code
    var userId = '';
    var responce = await DioServices().getMethod(
        "${ApiCastant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    print(
        "${ApiCastant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (responce.statusCode == 200) {
      infoArticle.value = InfoModel.fromJson(responce.data["info"]);
      responce.data["tags"].forEach((element) {
        tagsArticle.add(TagsModel.fromjson(element));
      });
      responce.data["related"].forEach((element) {
        relatedArtical.add(RelatedModel.fromJson(element));
      });
      isFavorite = responce.data["isFavorite"];

      //print(responce.toString());
    }
  }
}
