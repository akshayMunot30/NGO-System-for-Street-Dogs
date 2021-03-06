import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/adminSignUp.dart';
import '../screens/homepage_admin.dart';
import '../screens/addUser.dart';
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
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu Options',
              style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
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
            'Add a New volunteer',
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
            'Add a New Admin',
            Icons.person,
            context,
            SignUp(),
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
                  builder: (context) => MyHomePage(title: 'Stay Dogs'),
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
                  Icons.logout,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
