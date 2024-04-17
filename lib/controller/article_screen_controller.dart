import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/services/dio_service.dart';

import '../models/article_model/article_list_model.dart';

class ArticleScreenController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
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
}
