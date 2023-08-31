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
      theme: ThemeData(
          fontFamily: "Rubik",
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'Rubik', fontSize: 16, fontWeight: FontWeight.w800),
            bodyLarge: TextStyle(
                fontFamily: 'Rubik', fontSize: 13, fontWeight: FontWeight.w300),
            displayMedium: TextStyle(
                fontFamily: 'Rubik',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300),
          )),
      home: const Home(),
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
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Image.asset("assets/image/icon.png"),
          Align(
              alignment: Alignment.centerRight,
              child: Text('قیمت به روز سکه وارز',
                  style: Theme.of(context).textTheme.displayLarge)),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/image/menu.png"))),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/image/g.png'),
              const SizedBox(
                width: 8,
              ),
              Text(
                'نرخ ارز آزاد چیست؟',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
            child: Text(
              ' نرخ ارزها در معادلات نقدی و رایج روزانه است معادلات  نقدی معادلاتی هستند که خریدار و فروشنده به محض انجام معادله ارز و ریال رو باهم مبادله می کنند',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            width: double.infinity,
            height: 35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(1000)),
              color: Color.fromARGB(255, 130, 130, 130),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'نام آزاد ارز',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'قیمت',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'تغییر',
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
          SizedBox(
              height: 350,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(blurRadius: 0.1, color: Colors.grey)
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('دلار',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text('1000',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text('+3',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        )),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
