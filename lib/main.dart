import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/model/currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;

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
            displaySmall: TextStyle(
                fontFamily: 'Rubik',
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontFamily: 'Rubik',
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          )),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> curreny = [];

  // getResponse() {
  //   var url = 'http://sasansafari.com/flutter/api.php?access_key=flutter123456';
  //   http.get(Uri.parse(url)).then((value) {
  //     print(value.statusCode);
  //     if (curreny.isEmpty) {
  //       if (value.statusCode == 200) {
  //         List jsonList = convert.jsonDecode(value.body);
  //         if (jsonList.length > 0) {
  //           for (int i = 0; i < jsonList.length; i++) {
  //             setState(() {
  //               curreny.add(Currency(
  //                   id: jsonList[i]["id"],
  //                   title: jsonList[i]["title"],
  //                   price: jsonList[i]["price"],
  //                   chenge: jsonList[i]["changes"],
  //                   status: jsonList[i]["status"]));
  //             });
  //           }
  //         }
  //       }
  //     }
  //   });
  // }

  Future getResponse() async {
    var url = 'http://sasansafari.com/flutter/api.php?access_key=flutter123456';
    var value = await http.get(Uri.parse(url));
    //developer.log(value.body, name: 'getResponse');
    developer.log('getResponse', name: 'WLifeCycle');
    if (curreny.isEmpty) {
      if (value.statusCode == 200) {
        //developer.log(value.body, name: 'mine', error:convert.jsonDecode(value.body) );
        List jsonList = convert.jsonDecode(value.body);
        if (jsonList.isNotEmpty) {
          for (int i = 0; i < jsonList.length; i++) {
            setState(() {
              curreny.add(Currency(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  chenge: jsonList[i]["changes"],
                  status: jsonList[i]["status"]));
            });
          }
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResponse();
    developer.log('initState', name: 'WLifeCycle');
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget', name: 'WLifeCycle');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    developer.log('deactivate', name: 'WLifeCycle');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    developer.log('dispose', name: 'WLifeCycle');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    developer.log('didChangeDependencies', name: 'WLifeCycle');
  }

  @override
  Widget build(BuildContext context) {
    developer.log('build', name: 'WLifeCycle');
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
                    itemCount: curreny.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: MyItemes(index, curreny));
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
  int index;
  List<Currency> curreny;

  MyItemes(
    this.index,
    this.curreny, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Text(curreny[index].title!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(curreny[index].price!,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(
              curreny[index].chenge!,
              style: curreny[index].status == "n"
                  ? Theme.of(context).textTheme.displaySmall
                  : Theme.of(context).textTheme.headlineMedium,
            ),
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
