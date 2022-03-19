// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'إنشاء حساب طبيب',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
