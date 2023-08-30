import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) {
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
      theme: ThemeData(fontFamily: "Rubik"),
      home:const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Image.asset("assets/image/icon.png"),
          const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'قیمت به روز ارز',
                style: TextStyle(color: Colors.black),
              )),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/image/menu.png"))),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/image/g.png'),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'نرخ ارز آزاد چیست؟',
                style: TextStyle(),
              ),
            ],
          ),
          const Text(
            ' نرخ ارزها در معادلات نقدی و رایج روزانه است معادلات  نقدی معادلاتی هستند که خریدار و فروشنده به محض انجام معادله ارز و ریال رو باهم مبادله می کنند',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.black),
          )
        ]),
      ),
    );
  }
}
