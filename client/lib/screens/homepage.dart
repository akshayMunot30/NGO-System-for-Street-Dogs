import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"), // will later add name of our system
      ),
      body: Text("This is the home page. We will add the info about our system")
    );
  }
}