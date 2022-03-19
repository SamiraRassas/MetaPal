// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PatientReg extends StatelessWidget {
  const PatientReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: Scaffold(
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
                    'إنشاء حساب مريض',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Image(
              image: AssetImage('images/patient.png'),
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الإسم الكامل',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال الإسم الكامل';
              }
              return null;
            },
          ), //FullName

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الإختصاص',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Specialize area

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'إسم العيادة',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Clinic Name

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'رقم العيادة',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Clinic Phone

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'عنوان العيادة',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Clinic address

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'إسم المستخدم',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Username

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'كلمة المرور',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Pass

          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text(
                  'إنشاء حساب',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
