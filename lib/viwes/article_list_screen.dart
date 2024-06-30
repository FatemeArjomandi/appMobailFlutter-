import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/controller/article_list_controller.dart';

import '../component/my_component.dart';
import '../controller/article_single_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  final title = Get.arguments;

  final ArticleListController articleListController =
      Get.put(ArticleListController());

  final ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: apbar(title ?? 'لیست مقاله ها'),
      body: Obx(
        () => SizedBox(
          child: ListView.builder(
            itemCount: articleListController.articleList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () async {
                      await articleSingleController.getArticleInfo(
                          articleListController.articleList[index].id!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CachedNetworkImage(
                          imageUrl: articleListController
                              .articleList[index].image
                              .toString(),
                          imageBuilder: (context, imageProvider) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                articleListController.articleList[index].image
                                    .toString(),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                                width: 100,
                                height: 100,
                              ),
                            );
                          },
                          placeholder: (context, url) {
                            return const SpinKitCircle(
                              color: SolidColor.primeryColor,
                              size: 20,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 50,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  articleListController.articleList[index].title
                                      .toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 2),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      articleListController
                                          .articleList[index].author
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: SolidColor.subText)),
                                  Text(
                                      '${articleListController.articleList[index].view.toString()}بازدید',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: SolidColor.subText)),
                                  Text(
                                      articleListController
                                          .articleList[index].catName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: SolidColor.colorTitle)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
