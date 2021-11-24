import 'package:flutter/material.dart';

import 'package:ngo_system_for_street_dogs/api.dart';
import 'package:ngo_system_for_street_dogs/screens/homepage.dart';

import 'package:ngo_system_for_street_dogs/screens/signup.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  // var _loginValidate = adminLoginWithEmailPassword();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void _login() {
    // if(_emailController.text == )
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Homepage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login"),
      ),
      body: ListView(
        children: [
          Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    child: Image.asset(
                      'assets/images/front-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Email Id Input
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
                      controller: _emailController,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Email ID",
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

                  // Password Input
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
                      controller: _passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
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

                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Login"),
                    ),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "If you don't have an account, signup!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text("Create Account"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
