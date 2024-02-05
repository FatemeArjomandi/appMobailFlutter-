import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/data_model.dart';
import 'package:tech_blog/models/home_model/articles.dart';
import 'package:tech_blog/models/home_model/poster.dart';
import 'package:tech_blog/models/home_model/tags.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenCotroller extends GetxController {
  late Rx<PosterModel> poster;
  RxList<ArticleModel> topVisited = RxList();
  late RxList<PotcastModel> topPodcasts;
  late RxList<TagsModel> tags;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioServices().getMethod(ApiCastant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisited.add(ArticleModel.fromjson(element));
      });
    }
  }
}
