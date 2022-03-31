// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metapal/Screens/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'إنشاء حساب مريض',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Image(
          image: AssetImage('images/patient.png'),
          height: 60,
          width: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: const SignUpForm(),
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController P_FullName = new TextEditingController();
  TextEditingController P_Gender = new TextEditingController();
  TextEditingController P_Phone = new TextEditingController();
  TextEditingController P_age = new TextEditingController();
  TextEditingController P_DoctorCode = new TextEditingController();
  TextEditingController P_UserName = new TextEditingController();
  TextEditingController P_Pass = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  //! Gender
  final _gender = ["Male", "Female"];
  String? _currentGender;

  //! Clinic Name
  final _clinicname = [
    "Dr. Nadira Clinic",
    "Dr. Mohammad Clinic",
    "Dr. Sara Nutrition Clinic"
  ];
  String? _currentClinic;

  //! Doctor Name
  final _doctorname = ["Dr. Nadira Daamseh", "Dr. Mohammad"];
  String? _currentDoctor;
  //! Metabolic types
  final _metabolictypes = [
    "MSUD",
    "HCY",
    "OTC",
    "HT1",
    "CTLN1",
    "IVA",
    "MMA",
    "PA",
    "PKU"
  ];
  String? _currenttype;

  late DateTime _chosenDateTime;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: P_FullName,
              decoration: const InputDecoration(
                hintText: 'الإسم الكامل',
                hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 2, bottom: 0),
                //isDense: true, // A
              ),
              style: TextStyle(fontSize: 17.0, height: 1, color: Colors.black)

              // validator: (String? value) {
              //   if (value == null || value.isEmpty) {
              //     return 'يرجى إدخال الإسم الكامل';
              //   }
              //   return null;
              // },
              ), //FullName
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),

          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black, height: 0.5, fontSize: 16.0),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: "الجنس",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.only(top: 10, bottom: 5), // Added this
                  isDense: true,
                ),
                isEmpty: _currentGender == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentGender,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _currentGender = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: _gender.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),

          TextFormField(
              controller: P_Phone,
              decoration: const InputDecoration(
                hintText: "رقم الهاتف",
                hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 20, bottom: 10),
                isDense: true, // A
              ),
              style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black)

              // validator: (String? value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              ), //Clinic Name
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),

          TextFormField(
              controller: P_age,
              decoration: const InputDecoration(
                hintText: 'العمر',
                hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 20, bottom: 10),
                isDense: true,
                // A
              ),
              style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black)

              // validator: (String? value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              ), //Clinic address
          SizedBox(height: 20),
          Divider(
            color: Colors.blue,
            height: 20,
            thickness: 3,
            indent: 60,
            endIndent: 60,
          ),
          //
          //
          //! Clinic Name
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black, height: 0.5, fontSize: 16.0),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: "العيادة",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                  contentPadding: EdgeInsets.only(top: 2, bottom: 0),
                  isDense: true,
                ),
                isEmpty: _currentClinic == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentClinic,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _currentClinic = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: _clinicname.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          //
          //
          //! Doctor Name
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black, height: 0.5, fontSize: 16.0),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: "اسم الطبيب",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 0),
                  isDense: true,
                ),
                isEmpty: _currentDoctor == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentDoctor,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _currentDoctor = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: _doctorname.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          //
          //
          //! Metabolic Type
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black, height: 0.5, fontSize: 16.0),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: "التشخيص",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 0),
                  isDense: true,
                ),
                isEmpty: _currenttype == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currenttype,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _currenttype = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: _metabolictypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.blue,
            height: 20,
            thickness: 3,
            indent: 60,
            endIndent: 60,
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          TextFormField(
              controller: P_DoctorCode,
              decoration: const InputDecoration(
                hintText: 'رمز الطبيب',
                hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 15, bottom: 10),
                isDense: true,
              ),
              style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black)

              // validator: (String? value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              ),

          TextFormField(
              controller: P_UserName,
              decoration: const InputDecoration(
                hintText: 'إسم المستخدم',
                hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 20, bottom: 10),
                isDense: true,
              ),
              style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black)

              // validator: (String? value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              ), //Username
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          TextFormField(
            controller: P_Pass,
            decoration: const InputDecoration(
              hintText: 'كلمة المرور',
              contentPadding: EdgeInsets.only(top: 20, bottom: 10),
              isDense: true,
            ),
            style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            // validator: (String? value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'تأكيد كلمة المرور',
              contentPadding: EdgeInsets.only(top: 20, bottom: 10),
              isDense: true,
            ),
            style: TextStyle(fontSize: 17.0, height: 0.5, color: Colors.black),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            // validator: (String? value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
          ), //Pass
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Map<String, dynamic> PateintRegisterData = {
                    "FullName": P_FullName.text,
                    "Gender": _currentGender,
                    "Clinic name": P_Phone.text,
                    "Clinic phone": P_age.text,
                    "Clinic name": _currentClinic,
                    "Doctor name": _currentDoctor,
                    "Metabolic type": _currenttype,
                    "Clinic address": P_DoctorCode.text,
                    "UserName": P_UserName.text,
                    "Password": P_Pass.text,
                  };
                  FirebaseFirestore.instance
                      .collection("Patient Register data")
                      .add(PateintRegisterData);

                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  // if (_formKey.currentState!.validate()) {
                  //   // Process data.
                  // }
                  // // Validate will return true if the form is valid, or false if
                  // // the form is invalid.
                  // if (_formKey.currentState!.validate()) {
                  //   // Process data.
                  // }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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
