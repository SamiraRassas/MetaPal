// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:metapal/Screens/DoctorRegister/DoctorRegister.dart';
import 'package:metapal/Screens/PatientRegister/PatientRegister.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Logo(),
        Description(),
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Doctor',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Image(
                        image: AssetImage('images/doctor.png'),
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(height: 7),
                      ListTile(
                        //title: Text(""),
                        title: Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = 2;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ],
                  )),
              SizedBox(width: 50),
              Container(
                height: 200,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(height: 10),
                    // ignore: prefer_const_constructors
                    Text(
                      'Patient',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    // ignore: prefer_const_constructors
                    Image(
                      image: AssetImage('images/patient.png'),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(height: 7),
                    ListTile(
                      //title: Text("Male"),
                      title: Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = 1;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                DatabaseReference _test =
                    FirebaseDatabase.instance.ref().child("test");
                _test.set("Hello !!  ${Random().nextInt(100)}");
                if (val == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorReg()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientReg()),
                  );
                }
              }),
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('images/MetaLogo.png'),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      // ignore: prefer_const_constructors
      child: Text(
        "The first Metabolic application in Palestine with simple, straightforward and amazing design that allows Metabolic patients to schedule their meals under the supervision of their doctor.",
        // ignore: prefer_const_constructors
        style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontFamily: 'Times New Roman'),
      ),
    );
  }
}
