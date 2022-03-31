// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metapal/Components/Buttons/MyButton.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Image(
            image: AssetImage('images/MetaLogo1.png'),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            height: 200,
            //color: Colors.blue,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'تسجيل الدخول الى حسابك',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'اسم المستخدم',
                      hintStyle: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'يرجى إدخال الإسم الكامل';
                    //   }
                    //   return null;
                    // },
                  ), //FullName

                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'كلمة المرور',
                      hintStyle: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },
                  ), //Specialize area
                  SizedBox(
                    height: 80,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[200],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          // // Validate will return true if the form is valid, or false if
                          // // the form is invalid.
                          // if (_formKey.currentState!.validate()) {
                          //   // Process data.
                          // }

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => LoginPage()),
                          // );
                        },
                        child: const Text(
                          'تسجيل دخول',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
