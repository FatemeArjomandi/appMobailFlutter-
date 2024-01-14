import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/component/my_colors.dart';

import '../component/my_component.dart';

class PorofilScreen extends StatelessWidget {
  const PorofilScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image(
              image: Assets.image.imagePorofil.provider(),
              height: 120,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.pen.provider(),
                    color: SolidColor.colorTitle),
                Text(Strings.changeImageProfil,
                    style: Theme.of(context).textTheme.displaySmall)
              ],
            ),
            const SizedBox(height: 50),
            Text('فاطمه ارجمندی',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: SolidColor.primeryColor)),
            const SizedBox(height: 10),
            Text('Farjomandy76@gimal.com',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 40),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ThegDivider(),
                  InkWell(
                    onTap: () {},
                    splashColor: SolidColor.primeryColor,
                    child: Text(
                      'مقالات مورد علاقه من',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const ThegDivider(),
                  InkWell(
                    onTap: () {},
                    splashColor: SolidColor.primeryColor,
                    child: Text(
                      'پادکست های مورد علاقه من',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const ThegDivider(),
                  InkWell(
                    onTap: () {},
                    splashColor: SolidColor.primeryColor,
                    child: Text(
                      'خروج از حساب کاربری',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
