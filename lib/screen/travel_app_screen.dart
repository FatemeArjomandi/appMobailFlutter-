import 'package:flutter/material.dart';
import 'package:tech_blog/model/teravel_app_model.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _selectIndex = 0;
  final double _imageSize = 70;

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
            color: Colors.white,
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
                              backgroundBlendMode: BlendMode.colorBurn,
                              color: Colors.grey[400],
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.colorBurn,
                            color: Colors.grey[400],
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                //listViwe
                Positioned(
                  right: 0,
                  top: 100,
                  child: SizedBox(
                    width: 98,
                    height: 361,
                    child: ListView.builder(
                      itemCount: travelList.length,
                      itemBuilder: (context, index) {
                        return itemeImage(index);
                      },
                    ),
                  ),
                ),

                //name & location
                Positioned(
                  bottom: 100,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        travelList[_selectIndex].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.place,
                              color: Colors.white, size: 15),
                          Text(travelList[_selectIndex].location,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16)),
                        ],
                      )
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

  Widget itemeImage(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectIndex = index;
              });
            },
            child: AnimatedContainer(
              width: _selectIndex == index ? _imageSize + 15 : _imageSize,
              height: _selectIndex == index ? _imageSize + 15 : _imageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(travelList[index].image),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                    color: Colors.white, width: _selectIndex == index ? 4 : 2),
                borderRadius: BorderRadius.circular(15),
              ),
              duration: const Duration(milliseconds: 1000),
            ),
          ),
        ),
      ],
    );
  }
}
