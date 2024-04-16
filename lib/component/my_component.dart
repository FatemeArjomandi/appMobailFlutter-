import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_colors.dart';

class ThegDivider extends StatelessWidget {
  const ThegDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.3,
      indent: 60,
      endIndent: 60,
    );
  }
}

class TagListView extends StatelessWidget {
  const TagListView({super.key, required this.size, required this.index});

  final Size size;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
              const ImageIcon(AssetImage('assets/icons/hashTag.png'),
                  color: Colors.white, size: 15),
              const SizedBox(width: 20),
              Text(
                Get.find<HomeScreenCotroller>().tags[index].title!,
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

mylauncher(String url) async {
  var uri = Uri.parse(url);
  if (await launchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log('Could not url :$uri');
  }
}
//function Apbar
PreferredSize apbar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Rubik',
                  color: SolidColor.primeryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: SolidColor.apbarColor,
            ),
            width: 40,
            height: 40,
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
