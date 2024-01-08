import 'package:flutter/material.dart';

class TestFileReport extends StatelessWidget {
  const TestFileReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  Text('text1'),
                  Text('text2'),
                  Text('text3'),
                ],
              );
            }),
      ),
    );
  }
}
