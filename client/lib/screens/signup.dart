import 'package:flutter/material.dart';

import 'package:ngo_system_for_street_dogs/widgets/customInput.dart';
import 'package:ngo_system_for_street_dogs/screens/adminLogin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    // String dropdownValue = "Location";

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Admin Account"),
      ),
      body: ListView(
        children: [
          Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Image.asset(
                      'assets/images/front-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Email Id Input
                  CustomInput(hintText: "Full Name", isPasswordField: false),
                  CustomInput(hintText: "Phone Number", isPasswordField: false),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: TextField(
                      minLines: 1,
                      maxLines: 4,
                      obscureText: false,
                      onChanged: (String) {},
                      onSubmitted: (String) {},
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Address",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 20.0,
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  CustomInput(hintText: "Email ID", isPasswordField: false),
                  CustomInput(hintText: "Password", isPasswordField: true),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          ),
                        );
                      },
                      child: Text("Create Account"),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.all(10.0),
                  //       child: DropdownButton<String>(
                  //         value: dropdownValue,
                  //         icon: const Icon(Icons.arrow_drop_down_outlined),
                  //         iconSize: 24,
                  //         elevation: 16,
                  //         style: const TextStyle(color: Colors.black),
                  //         underline: Container(
                  //           height: 2,
                  //           color: Colors.black,
                  //         ),
                  //         onChanged: (String? newValue) {
                  //           setState(() {
                  //             dropdownValue = newValue!;
                  //           });
                  //         },
                  //         items: <String>['Location', 'Two', 'Free', 'Four']
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
