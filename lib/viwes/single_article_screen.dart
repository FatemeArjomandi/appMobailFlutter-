import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/controller/article_list_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/viwes/article_list_screen.dart';

import '../controller/article_single_controller.dart';

class SingleArticleScreen extends StatelessWidget {
  SingleArticleScreen({super.key});
  final ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());
  //final _id = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: Obx(
          () => ListView(children: [
            Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: articleSingleController.infoArticle.value.image!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      );
                    },
                    placeholder: (context, url) => const SpinKitCircle(
                          color: SolidColor.primeryColor,
                          size: 50,
                        ),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/image/imageUrl.png')),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradiantColor.sigleArticleApbar,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 17, 10, 30),
                  child: Text(
                    articleSingleController.infoArticle.value.title.toString(),
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                            image: Assets.image.imagePorofil.provider(),
                            width: 40,
                            height: 40),
                        const SizedBox(width: 20),
                        Text(
                            articleSingleController.infoArticle.value.author
                                .toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(width: 20),
                        Text(
                          '2' 'روز پیش',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: SolidColor.subText),
                        )
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: HtmlWidget(
                    articleSingleController.infoArticle.value.content
                        .toString(),
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        SpinKitCircle(
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const Tags(),
            const SizedBox(height: 60),
            Related(size: size)
          ]),
        ),
      )),
    );
  }
}

class Tags extends StatelessWidget {
  const Tags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: Get.find<ArticleSingleController>().tagsArticle.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () async {
                  var tagId = Get.find<ArticleSingleController>()
                      .tagsArticle[index]
                      .id
                      .toString();
                  await Get.find<ArticleListController>()
                      .getArticWithTagId(tagId);
                  Get.to(
                    () => ArticleListScreen(),
                    arguments: Get.find<ArticleSingleController>()
                        .tagsArticle[index]
                        .title
                        .toString(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: SolidColor.surface,
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Text(
                          Get.find<ArticleSingleController>()
                              .tagsArticle[index]
                              .title
                              .toString(),
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Related extends StatelessWidget {
  const Related({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: size.width / 8, bottom: 20),
          child: Text(
            Strings.relatedArtical,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                Get.find<ArticleSingleController>().relatedArtical.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Get.find<ArticleSingleController>()
                              .getArticleInfo(
                                  Get.find<ArticleSingleController>()
                                      .relatedArtical[index]
                                      .id!);
                        },
                        child: CachedNetworkImage(
                            imageUrl: Get.find<ArticleSingleController>()
                                .relatedArtical[index]
                                .image
                                .toString(),
                            imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                          colors: GradiantColor.blogpost,
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                  height: 150,
                                  width: 150,
                                ),
                            placeholder: (context, url) => const SpinKitCircle(
                                color: SolidColor.primeryColor, size: 32),
                            errorWidget: (context, url, error) => const Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                )),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 150,
                        child: Text(
                          Get.find<ArticleSingleController>()
                              .relatedArtical[index]
                              .title
                              .toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: UnconstrainedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? size.width / 13 : 15),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                Get.find<ArticleSingleController>()
                                    .relatedArtical[index]
                                    .author
                                    .toString(),
                                style: Theme.of(context).textTheme.titleLarge),
                            Row(
                              children: [
                                Text(
                                  Get.find<ArticleSingleController>()
                                      .relatedArtical[index]
                                      .view!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 17,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
            },
          ),
        ),
      ],
    );
  }
}
