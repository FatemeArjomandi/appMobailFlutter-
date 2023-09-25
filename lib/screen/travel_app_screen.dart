import 'package:flutter/material.dart';
import 'package:tech_blog/model/teravel_app_model.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height / 1.8,
            color: Colors.red,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height / 2.1,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.elliptical(100, 80),
                          bottomRight: Radius.elliptical(100, 80)),
                      image: DecorationImage(
                          image: AssetImage(travelList[_selectIndex].image),
                          fit: BoxFit.cover)),
                ),

                //Icons heder
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey[300], shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back_ios_new)),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[300], shape: BoxShape.circle),
                        child: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.blue,
          )),
        ],
      ),
    ));
  }
}
