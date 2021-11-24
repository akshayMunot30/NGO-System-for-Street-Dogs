import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/widgets/maindrawer_volunteer.dart';


class VolunteerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"), // will later add name of our system
        ),
        drawer: MainDrawer_volunteer(),
        body: Text(
            "This is the home page. We will add the info about our system"));
  }
}
