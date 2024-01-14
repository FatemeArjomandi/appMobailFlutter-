import 'package:flutter/material.dart';
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
        HomePagePoster(size: size),
        const SizedBox(height: 16),
        HomePageTagList(size: size),
        SeeMoreBlogList(size: size),
        HomePageBlogList(size: size),
        SeeMorePotcastList(size: size),
        HomePagePotcastList(size: size),
      ],
    );
  }
}

class HomePagePotcastList extends StatelessWidget {
  const HomePagePotcastList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: potcastList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(potcastList[index].imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 130,
                  width: 150,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 130,
                  child: Text(potcastList[index].titel,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center),
                )
              ],
            ),
          );
        },
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          return Stack(children: [
            Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(blogList[index].imageUrl),
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
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 150,
                    child: Text(
                      blogList[0].titel,
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
                  padding:
                      EdgeInsets.only(right: index == 0 ? size.width / 13 : 15),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(homePagePosterMap["writer"],
                            style: Theme.of(context).textTheme.titleLarge),
                        Row(
                          children: [
                            Text(
                              homePagePosterMap["viwe"],
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
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, 8, index == 0 ? size.width / 13 : 15, 8),
            child: TagListView(
              size: size,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(homePagePosterMap["imageAssets"]),
                fit: BoxFit.cover),
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: GradiantColor.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
                    homePagePosterMap["writer"] +
                        " _ " +
                        homePagePosterMap["date"],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["viwe"],
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
              Text(
                homePagePosterMap["titel"],
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
