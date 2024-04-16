import 'package:flutter/material.dart';

import '../component/my_component.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: apbar('مقالات مورد علاقه من'),
    ));
  }
}
