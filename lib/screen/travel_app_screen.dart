import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
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
      child: SingleChildScrollView(
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
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
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
                      height: 300,
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
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  //card view
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Colors.black26, width: 1)),
                        child: SizedBox(
                          width: 86,
                          height: 87,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'distance',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text('${travelList[_selectIndex].distance}Km',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Colors.black26, width: 1)),
                        child: SizedBox(
                          width: 86,
                          height: 87,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'temp',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text('${travelList[_selectIndex].temp}\u00B0  C',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Colors.black26, width: 1)),
                        child: SizedBox(
                          width: 86,
                          height: 87,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'rating',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(travelList[_selectIndex].rating,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),

                  //description
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'description',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        ExpandableText(
                          travelList[_selectIndex].description,
                          expandText: 'Read more',
                          collapseText: 'collapse',
                          //maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 27),
                  //button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text('total price'),
                          Text(
                            '${travelList[_selectIndex].price}\$',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 85,
                        height: 85,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.black,
                          child: const Icon(CupertinoIcons.forward),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
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
