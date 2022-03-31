// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? ButtonText;
  // ignore: non_constant_identifier_names
  const Button({Key? key, this.ButtonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          ButtonText!,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => PatientReg()),
          // );
        });
  }
}
