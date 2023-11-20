import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/viwes/main_screen.dart';
import 'package:tech_blog/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>  const MainScreen (),
          ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.image.logo.provider(), height: 64),
            const SizedBox(height: 30),
            const SpinKitFadingCube(
              color: SolidColor.primeryColor,
              size: 30.0,
            )
          ],
        ),
      )),
    );
  }
}
