import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: SolidColor.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Image(
                image: Assets.image.logo.provider(),
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height / 8,
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: GradiantColor.buttomNavBakgrand)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UnconstrainedBox(
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                          colors: GradiantColor.buttomNav)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.home.provider(),
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.write.provider(),
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.user.provider(),
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        body: HomeScreen(size: size),
      ),
    );
  }
}
