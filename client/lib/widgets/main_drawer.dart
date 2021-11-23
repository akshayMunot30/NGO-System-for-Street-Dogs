import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDarwer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: (
              Icon(Icons.account_circle, size: 25,),
              Text(
              'Menu Options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'New Locality',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'Add a new volunteer',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'Check Weekly Reports',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'Check Today\'s Record',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'Send Reminders',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_tree_rounded,
              size: 10,
            ),
            title: Text(
              'Add New Record',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              //...
            },
          ),
        ],
      ),
    );
  }
}
