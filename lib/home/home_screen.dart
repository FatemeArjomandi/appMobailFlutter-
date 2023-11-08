import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/facke_data.dart';
import 'package:tech_blog/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 16),
            //appBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Image(
                  image: Assets.image.logo.provider(),
                  height: size.height / 13.6,
                ),
                const Icon(Icons.search),
              ],
            ),
            const SizedBox(height: 8),
            //poster
            Stack(
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
            ),
            const SizedBox(height: 16),
            //Tag
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: tagList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? size.width / 13 : 15, 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: GradiantColor.tags,
                              begin: Alignment.bottomRight,
                              end: Alignment.bottomLeft)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageIcon(
                                AssetImage('assets/icons/hashTag.png'),
                                color: Colors.white,
                                size: 15),
                            const SizedBox(width: 20),
                            Text(
                              tagList[index].titel,
                              style: Theme.of(context).textTheme.displayMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
