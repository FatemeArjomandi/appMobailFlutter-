import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

class RegisterInto extends StatelessWidget {
  const RegisterInto({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/svgTech.svg',
              height: 100,
            ),
            const SizedBox(height: 16),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: Strings.welcome,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return SolidColor.subText;
                      }
                      return SolidColor.primeryColor;
                    },
                  ),
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context).textTheme.headlineLarge;
                    }
                    return Theme.of(context).textTheme.headlineMedium;
                  })),
              child: const Text('بزن بریم'),
            )
          ],
        ),
      ),
    ));
  }
}
