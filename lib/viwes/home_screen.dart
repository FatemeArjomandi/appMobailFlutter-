import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/facke_data.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/component/my_colors.dart';

import '../component/my_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 8),
        Poster(size: size),
        const SizedBox(height: 16),
        HomePageTagList(size: size),
        SeeMoreBlogList(size: size),
        TopVisited(size: size),
        SeeMorePotcastList(size: size),
        TopPodcast(size: size),
      ],
    );
  }
}

class TopPodcast extends StatelessWidget {
  const TopPodcast({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final homeScreenCotroller = Get.find<HomeScreenCotroller>();
    return SizedBox(
      height: size.height / 3.8,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenCotroller.topPodcasts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: 150,
                    child: homeScreenCotroller.topPodcasts[index].poster!
                            .contains("''")
                        ? const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                homeScreenCotroller.topPodcasts[index].poster!,
                            errorWidget: (context, url, error) =>
                                homeScreenCotroller.erroeUrl(
                                    context, url, error),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const SpinKitFadingCircle(
                              color: SolidColor.primeryColor,
                              size: 32.0,
                            ),
                          ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 130,
                    child: Text(homeScreenCotroller.topPodcasts[index].title!,
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SeeMorePotcastList extends StatelessWidget {
  const SeeMorePotcastList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, size.width / 13, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.potcast.provider(),
            color: SolidColor.colorTitle,
            size: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(Strings.viewHotstPodcast,
              style: Theme.of(context).textTheme.displaySmall)
        ],
      ),
    );
  }
}

class TopVisited extends StatelessWidget {
  const TopVisited({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final homeScreenCotroller = Get.find<HomeScreenCotroller>();

    return SizedBox(
      height: 210,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenCotroller.topVisited.length,
          itemBuilder: (context, index) {
            return Stack(children: [
              Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: homeScreenCotroller.topVisited[index].image!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
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
                      errorWidget: (context, url, error) =>
                          homeScreenCotroller.erroeUrl(context, url, error),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: Text(
                        homeScreenCotroller.topVisited[index].title!,
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
                          Text(homeScreenCotroller.topVisited[index].author!,
                              style: Theme.of(context).textTheme.titleLarge),
                          Row(
                            children: [
                              Text(
                                homeScreenCotroller.topVisited[index].view!,
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
    );
  }
}

class SeeMoreBlogList extends StatelessWidget {
  const SeeMoreBlogList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 32, size.width / 13, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.provider(),
            color: SolidColor.colorTitle,
            size: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(Strings.viewHotstBlog,
              style: Theme.of(context).textTheme.displaySmall)
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final homeScreenCotroller = Get.find<HomeScreenCotroller>();
    return SizedBox(
      height: 60,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenCotroller.tags.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? size.width / 13 : 15, 8),
              child: TagListView(
                size: size,
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final homeScreenCotroller = Get.find<HomeScreenCotroller>();
    return Obx(
      ()=> homeScreenCotroller.loding.value==false?
      Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: homeScreenCotroller.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              height: size.height / 4.2,
              width: size.width / 1.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      colors: GradiantColor.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            placeholder: (context, url) {
              return const SpinKitCircle(
                  color: SolidColor.primeryColor, size: 32);
            },
            errorWidget: (context, url, error) =>
                homeScreenCotroller.erroeUrl(context, url, error),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${homeScreenCotroller.topVisited[1].author!} _ ${homeScreenCotroller.topVisited[1].createdAt!}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          homeScreenCotroller.topVisited[1].view!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.remove_red_eye_sharp,
                          color: Colors.white,
                          size: 17,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width / 1.19,
                  child: Text(
                    homeScreenCotroller.poster.value.title!,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                    
                  ),
                )
              ],
            ),
          )
        ],
      ): const SpinKitCircle(color: SolidColor.primeryColor,size: 32,),
    );
  }
}
