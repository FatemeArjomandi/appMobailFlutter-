import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft, child: Icon(Icons.menu))),
            Align(
                alignment: Alignment.centerRight,
                child: Text('قیمت به روز ارز',style: TextStyle(color: Colors.black),)),
            Icon(Icons.macro_off_rounded)
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نرخ ارز آزاد چیست؟',
                  style: TextStyle(),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.macro_off)
              ],
            ),
            Text(
              ' نرخ ارزها در معادلات نقدی و رایج روزانه است معادلات  نقدی معادلاتی هستند که خریدار و فروشنده به محض انجام معادله ارز و ریال رو باهم مبادله می کنند',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.black),
            )
          ]),
        ),
      ),
    );
  }
}
