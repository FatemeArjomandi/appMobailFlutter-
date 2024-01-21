import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/facke_data.dart';
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
    return Container(
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
              tagList[index].titel,
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
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
