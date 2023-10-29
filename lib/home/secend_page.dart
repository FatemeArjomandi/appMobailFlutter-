import 'package:flutter/material.dart';

class SecendPage extends StatelessWidget {
  const SecendPage({super.key, required this.idText});
  final idText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(idText),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('data2'))
          ],
        ),
      ),
    );
  }
}
