import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
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
            Stack(
              children: [
                Container(
                  height: size.height / 4.2,
                  width: size.width / 1.19,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image:
                              Image(image: Assets.image.programming.provider())
                                  .image,
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: size.height / 4.2,
                  width: size.width / 1.19,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                          colors: GradiantColor.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
