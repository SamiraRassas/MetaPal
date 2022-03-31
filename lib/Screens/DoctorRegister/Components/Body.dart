// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metapal/my_icons_icons.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
          SizedBox(height: 20),
          Image(
            image: AssetImage('images/doctor.png'),
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: const SignUpForm(),
          ),
        ],
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
  TextEditingController D_FullName = new TextEditingController();
  TextEditingController D_Specialist = new TextEditingController();
  TextEditingController D_ClinicName = new TextEditingController();
  TextEditingController D_ClinicPhone = new TextEditingController();
  TextEditingController D_ClinicAddress = new TextEditingController();
  TextEditingController D_UserName = new TextEditingController();
  TextEditingController D_Pass = new TextEditingController();
  //TextEditingController D_FullName = new TextEditingController();
  //CollectionReference DoctorData = FirebaseFirestore.instance.collection("DoctorData");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//! Metabolic types
  final _metabolicspecialist = [
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
  String? _currentspecialist;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: D_FullName,
            decoration: const InputDecoration(
              hintText: 'الإسم الكامل',
              //prefixIcon: Icon(MyIcons.address_book),
              contentPadding: EdgeInsets.only(top: 20, bottom: 2),
              isDense: true,
            ),
            // validator: (String? value) {
            //   if (value == null || value.isEmpty) {
            //     return 'يرجى إدخال الإسم الكامل';
            //   }
            //   return null;
            // },
          ), //FullName

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
                isEmpty: _currentspecialist == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentspecialist,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _currentspecialist = newValue!;
                        state.didChange(newValue);
                      });
                    },
                    items: _metabolicspecialist.map((String value) {
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

          TextFormField(
            controller: D_ClinicName,
            decoration: const InputDecoration(
              hintText: 'إسم العيادة',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Clinic Name

          TextFormField(
            controller: D_ClinicPhone,
            decoration: const InputDecoration(
              hintText: 'رقم العيادة',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Clinic Phone

          TextFormField(
            controller: D_ClinicAddress,
            decoration: const InputDecoration(
              hintText: 'عنوان العيادة',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 20),
          Divider(
            color: Colors.blue,
            height: 20,
            thickness: 3,
            indent: 60,
            endIndent: 60,
          ), //Clinic address

          TextFormField(
            controller: D_UserName,
            decoration: const InputDecoration(
              hintText: 'إسم المستخدم',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), //Username

          TextFormField(
            controller: D_Pass,
            decoration: const InputDecoration(
              hintText: 'كلمة المرور',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'تأكيد كلمة المرور',
              contentPadding: EdgeInsets.only(top: 15, bottom: 0),
              isDense: true,
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          //Pass
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Map<String, dynamic> DoctorData = {
                    "FullName": D_FullName.text,
                    "Clinic name": D_ClinicName.text,
                    "Clinic phone": D_ClinicPhone.text,
                    "Clinic address": D_ClinicAddress.text,
                    "UserName": D_UserName.text,
                    "Password": D_Pass.text,
                    "Specialize": _currentspecialist,
                  };
                  FirebaseFirestore.instance
                      .collection("DoctorData")
                      .add(DoctorData);

                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  // if (_formKey.currentState!.validate()) {
                  //   // Process data.
                  // }
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

void InputText11(String hint, int toppadd, int bottompadd, String errortext) {}

// @widget
// Widget InputText(String hint, int toppadd, int bottompadd, String errortext) =>
//     Column(children: [
//       TextFormField(
//         decoration: const InputDecoration(
//           hintText: '$hint',
//           contentPadding: EdgeInsets.only(top: 15, bottom: 0),
//           isDense: true,
//         ),
//         obscureText: true,
//         enableSuggestions: false,
//         autocorrect: false,
//         validator: (String? value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter some text';
//           }
//           return null;
//         },
//       ),
//     ]);

// class HeaderSection extends StatelessWidget {
//   final String? title;
//   final String? name;
//   final bool? obscureText1;
//   const HeaderSection({Key? key, this.title, this.name, this.obscureText1})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       TextFormField(
//         decoration: const InputDecoration(
//           hintText: 'title',
//           contentPadding: EdgeInsets.only(top: 15, bottom: 0),
//           isDense: true,
//         ),
//         obscureText: obscureText1!,
//         enableSuggestions: false,
//         autocorrect: false,
//         validator: (String? value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter some text';
//           }
//           return null;
//         },
//       ),
//     ]);
//   }
// }
