import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
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
      onTap: () {
        //...
      },
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
            child: (Text(
              'Menu Options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'New Locality',
            Icons.account_tree_rounded,
          ),
          buildListTile(
            'Add a new volunteer',
            Icons.accessibility_new,
          ),
          buildListTile(
            'Check Weekly Reports',
            Icons.ad_units,
          ),
          buildListTile(
            'Check Today\'s Record',
            Icons.account_balance_wallet_rounded,
          ),
          buildListTile(
            'Send Reminders',
            Icons.access_alarm,
          ),
          buildListTile(
            'Add New Record',
            Icons.add,
          ),
        ],
      ),
    );
  }
}
