import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/services/dio_service.dart';

import '../models/article_model/article_list_model.dart';

class ArticleListController extends GetxController {
  final List<ArticleListModel> articleList = RxList();
  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    var response = await DioServices().getMethod(ApiCastant.getArticleList);
    if (response.statusCode == 200) {
      for (var element in (response.data as List)) {
        articleList.add(ArticleListModel.fromjson(element));
      }
    }
  }

  getArticWithTagId(String id) async {
    var response = await DioServices().getMethod(
        "${ApiCastant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=");
    if (response.statusCode == 200) {
      articleList.clear();
      for (var element in (response.data as List)) {
        articleList.add(ArticleListModel.fromjson(element));
      }
    }
  }
}
