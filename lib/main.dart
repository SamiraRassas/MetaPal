// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './Screens/WelcomePage/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

//void main() => runApp(WelcomePage());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: Directionality(
    // add this
    textDirection: TextDirection.rtl,
    child: WelcomePage(),
  )));
}
