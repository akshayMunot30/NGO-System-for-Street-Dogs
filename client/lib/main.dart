import 'package:flutter/material.dart';
<<<<<<< HEAD
import './screens/add_new_locality.dart';
=======
import 'package:ngo_system_for_street_dogs/api.dart';
>>>>>>> ed74b8869b2fe6f6ed5605a1e8faee7782b92f89

import 'package:ngo_system_for_street_dogs/screens/adminLogin.dart';
import 'package:ngo_system_for_street_dogs/screens/volunteerLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ApiClient()
        .adminLoginWithEmailPassword('hemnanisahil777@gmail.com', '********');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLogin(),
                      ),
                    );
                  },
                  child: Text("Login as Admin"),
                ),
                Divider(
                  indent: 110,
                  endIndent: 110,
                  height: 50,
                  thickness: 1,
                  color: Colors.black,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VolunteerLogin(),
                      ),
                    );
                  },
                  child: Text("Login as Volunteer"),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  "\"DOGS DO SPEAK,\nBUT ONLY TO THOSE,\nWHO KNOW HOW TO LISTEN\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
<<<<<<< HEAD
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminLogin(),
                    ),
                  );
                },
                child: Text("Login as Admin"),
              ),
              Divider(
                indent: 110,
                endIndent: 110,
                height: 50,
                thickness: 1,
                color: Colors.black,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VolunteerLogin(),
                    ),
                  );
                },
                child: Text("Login as Volunteer"),
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                "\"DOGS DO SPEAK,\nBUT ONLY TO THOSE,\nWHO KNOW HOW TO LISTEN\"",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              // ElevatedButton(onPressed: ()=>{}), child: Text("Login")),
            ],
=======

                // ElevatedButton(onPressed: ()=>{}), child: Text("Login")),
              ],
            ),
>>>>>>> ed74b8869b2fe6f6ed5605a1e8faee7782b92f89
          ),
        ),
      ),
    );
  }
}
