import 'package:flutter/material.dart';
import 'package:tech_blog/home/secend_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: id,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '@FatemeArjomandi'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecendPage(
                          idText: id.text,
                        ),
                      ));
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
