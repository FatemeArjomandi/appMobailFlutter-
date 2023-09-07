import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/model/currency.dart';

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
                fontFamily: 'Rubik', fontSize: 16, fontWeight: FontWeight.w900),
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
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
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
              //
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
              //list
              SizedBox(
                  height: 350,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: MyItemes());
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      if (index % 10 == 0) {
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Advertising(),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )),
              //update button box
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      color: Color.fromARGB(255, 232, 232, 232)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          onPressed: () => _showeSnackbar(
                              context, 'به روز رسانی با موفقیت انجام شد'),
                          icon: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              CupertinoIcons.refresh_bold,
                              color: Colors.black,
                            ),
                          ),
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'بروز رسانی',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 202, 193, 255)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(1000)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Text(
                          'آخرین بروز رسانی ${_getTime()}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  String _getTime() {
    return '20:45';
  }
}

void _showeSnackbar(BuildContext context, String masage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      masage,
      style: Theme.of(context).textTheme.displayMedium,
    ),
    backgroundColor: Colors.green,
  ));
}

// ignore: must_be_immutable
class MyItemes extends StatelessWidget {
  MyItemes({
    super.key,
  });
  List<Currency> curreny = [];

  @override
  Widget build(BuildContext context) {
    curreny.add(Currency(
        title: 'دلار آمریکا', price: '20000', chenge: '+5', status: 'p'));
    curreny.add(Currency(
        title: 'دلار استرالیا', price: '20000', chenge: '-1.4', status: 'n'));
    curreny.add(
        Currency(title: 'یورو', price: '20000', chenge: '-2', status: 'n'));
    curreny.add(Currency(
        title: 'لیر ترکیه', price: '20000', chenge: '+5', status: 'p'));
    curreny.add(Currency(
        title: 'دلار آلمان', price: '20000', chenge: '+5', status: 'p'));
    curreny.add(Currency(
        title: 'دلار روسیه', price: '20000', chenge: '+1.02', status: 'p'));
    return Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 0.1, color: Colors.grey)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(1000))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(curreny[0].title!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(curreny[0].price!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(curreny[0].chenge!,
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ));
  }
}

class Advertising extends StatelessWidget {
  const Advertising({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 0.1, color: Colors.grey)
            ],
            color: Colors.blueAccent[100],
            borderRadius: const BorderRadius.all(Radius.circular(1000))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('تبلیغات', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ));
  }
}
