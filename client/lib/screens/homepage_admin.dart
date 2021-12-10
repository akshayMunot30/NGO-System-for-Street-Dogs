import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/widgets/main_drawer.dart';
import '../widgets/main_drawer.dart';

class AdminHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stay Dogs"), // will later add name of our system
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  height: 170,
                  child: Image.asset('assets/images/homePage.png'),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  height: 25,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Text(
                    "\"Dogs do speak, but only to those who know how to listen\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.brown.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Text(
                    "Hello Cynophiles!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: Text(
                    "Stay Dogs is a non-profit organization dedicated to helping stray dogs in their everyday lives by sterilizing them, treating their injuries and illnesses, and putting them up for adoption.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 2.0,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome to the Family!",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  height: 120,
                  child: Image.asset('assets/images/twoDogs.png'),
                ),
              ],
              // Text("")
            ),
          ),
        ),
      ),
    );
  }
}
