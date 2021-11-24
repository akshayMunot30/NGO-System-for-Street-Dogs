import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/main.dart';
import 'package:ngo_system_for_street_dogs/screens/add_newRecord_page.dart';


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
