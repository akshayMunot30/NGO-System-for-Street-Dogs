import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/screens/homepage_admin.dart';
import '../screens/addUser.dart';
import '../screens/homepage_volunteer.dart';
import '../main.dart';
import '../screens/add_newRecord_page.dart';
import '../screens/monthly_reports.dart';
import '../screens/add_new_locality.dart';

class MainDrawer extends StatelessWidget {
  void selectCategory(BuildContext ctx, Widget page) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return page;
        },
      ),
    );
  }

  Widget buildListTile(
      String title, IconData icon, BuildContext ctx, Widget pa) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => selectCategory(ctx, pa),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(0, 10, 10, 0.5),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu Options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),SizedBox(
            height: 20,
          ),buildListTile(
            'Stay Dogs',
            Icons.home,
            context,
            AdminHomepage(),
          ),
          buildListTile(
            'New Locality',
            Icons.account_tree_rounded,
            context,
            AddNewLocality(),
          ),
          buildListTile(
            'Add a new volunteer',
            Icons.accessibility_new,
            context,
            AddVolunteer(),
          ),
          buildListTile(
            'Check Monthly Report',
            Icons.ad_units,
            context,
            MonthlyReport(),
          ),
          buildListTile(
            'Add New Record',
            Icons.add,
            context,
            AddNewRecord(),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color.fromRGBO(0, 10, 10, 0.5),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Login Page'),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}