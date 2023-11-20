import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/viwes/splash_screen.dart';
import 'package:tech_blog/theme/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColor.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColor.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), //persion
          //Locale('en'), // Spanish
        ],
        theme: ThemeData(
            fontFamily: "Rubik",
            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: SolidColor.posterTitel),
              titleLarge: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColor.posterSubTitel),
                  titleMedium: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColor.textTitle),titleSmall: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: SolidColor.textTitle),
              bodyLarge: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
              displayMedium: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              displaySmall: TextStyle(
                  fontFamily: 'Rubik',
                  color: SolidColor.colorTitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              headlineMedium: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            )),
        home: const SplashScreen());
  }
}
