import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/screens/add_newRecord_page.dart';
import 'package:ngo_system_for_street_dogs/screens/signup.dart';
import 'package:ngo_system_for_street_dogs/screens/record.dart';
import 'package:ngo_system_for_street_dogs/screens/monthly_reports.dart';
import 'package:ngo_system_for_street_dogs/screens/volunteerLogin.dart';
import '../screens/add_new_locality.dart';

class MainDrawer_volunteer extends StatelessWidget {
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
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Check Monthly Report',
            Icons.ad_units,
            context,
            WeelkyReports(),
          ),
          buildListTile(
            'Check Today\'s Record',
            Icons.account_balance_wallet_rounded,
            context,
            TodayReport(),
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
          buildListTile(
            'Log Out',
            Icons.person,
            context,
            VolunteerLogin(),
          ),
        ],
      ),
    );
  }
}
