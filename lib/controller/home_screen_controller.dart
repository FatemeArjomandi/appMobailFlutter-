import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/home_model/articles.dart';
import 'package:tech_blog/models/home_model/podcasts.dart';
import 'package:tech_blog/models/home_model/poster.dart';
import 'package:tech_blog/models/home_model/tags.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenCotroller extends GetxController {
  late Rx<PosterModel> poster;
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastsModel> topPodcasts = RxList();
  RxList<TagsModel> tags = RxList();
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  Widget erroeUrl(BuildContext context, String url, Object error) {
      if (url == "https://techblog.sasansafari.com''" || url.isEmpty) {
        return const Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: 50,
        );
      } else if (error is DioException && error.response?.statusCode == 404) {
        return const Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: 50,
        );
      } else if (error is DioException &&
          error.response?.headers['content-type']?.contains('image') != true) {
        return const Icon(
          Icons.image_aspect_ratio,
          color: Colors.grey,
          size: 50,
        );
      } else {
        return const Icon(
          Icons.image,
          color: Colors.grey,
          size: 50,
        );
      }
    }

  getHomeItems() async {
    var response = await DioServices().getMethod(ApiCastant.getHomeItems);

    if (response.statusCode == 200) {
      (response.data['top_visited'] as List).forEach(
        (element) {
          topVisited.add(ArticleModel.fromjson(element));
        },
      );
      response.data["top_podcasts"].forEach(
        (element) {
          topPodcasts.add(PodcastsModel.fromjson(element));
        },
      );
      response.data['tags'].forEach((element) {
        tags.add(TagsModel.fromjson(element));
      });
    }
  }
}
