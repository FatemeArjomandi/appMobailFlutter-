import 'package:flutter/material.dart';
import 'package:tech_blog/model/teravel_app_model.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final int _selectIndex = 0;
  final double _imageSize = 75;

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
                //image
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
                //listViwe
                ListView.builder(
                  itemCount: travelList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                              width: _imageSize,
                              height: _imageSize,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(travelList[index].image),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              duration: const Duration(milliseconds: 5000),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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
