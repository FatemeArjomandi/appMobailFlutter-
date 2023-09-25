import 'package:flutter/material.dart';
import 'package:tech_blog/screen/travel_app_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TravelApp(),
    );
  }
}

class MyTravelApp extends StatelessWidget {
  const MyTravelApp({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Container(
              width: size.width,
              height: 50,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            right: 20,
            child: SizedBox(
              //color: Colors.white,
              width: 75,
              height: 570,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Image.asset(
                        'assets/image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: size.height / 3,
              width: size.width,
              //color: Colors.green[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UnconstrainedBox(
                      child: SizedBox(
                        width: 299,
                        height: 87,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 85,
                              height: 87,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'distance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    '7km',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              width: 85,
                              height: 87,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'distance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    '7km',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              width: 85,
                              height: 87,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'distance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    '7km',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    const UnconstrainedBox(
                      child: SizedBox(
                        width: 299,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'description',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'This is the shortest of the three routes, but certainly not any less interesting. The North Wales Way leads you in 120 km from Abergwyngregyn to the beautiful island of Anglesey... read more',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    UnconstrainedBox(
                      child: SizedBox(
                        width: 299,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  'total price',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  '\$1270',
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            ),
                            FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
