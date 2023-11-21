import 'package:flutter/material.dart';

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