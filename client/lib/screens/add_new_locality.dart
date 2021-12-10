import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/api.dart';
import 'package:ngo_system_for_street_dogs/screens/homepage_admin.dart';
import 'package:ngo_system_for_street_dogs/widgets/main_drawer.dart';

class AddNewLocality extends StatelessWidget {
  static const routName = '/addNewLocality';

  @override
  Widget build(BuildContext context) {
    TextEditingController _newLocality = new TextEditingController();
    TextEditingController _estimatedDogs = new TextEditingController();

    void _addLocality() {
      ApiClient().addLocality(_newLocality.text, _estimatedDogs.text);
      _newLocality.clear();
      _estimatedDogs.clear();
      showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Added Successfully',
          style: TextStyle(color: Colors.green),
        ),
        content: const Text('New Locality has been added successfully!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminHomepage(),
                ),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Locality'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 100,
                  child: Image.asset("assets/images/locationPin.jpg"),
                ),

                // New Locality Input Field
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextField(
                    controller: _newLocality,
                    minLines: 1,
                    maxLines: 4,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "New Locality",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20.0,
                      ),
                    ),
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Estimated Number of Dogs Input Field
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _estimatedDogs,
                    minLines: 1,
                    maxLines: 4,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Estimated Number of Dogs.",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20.0,
                      ),
                    ),
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),

                //Submit Button
                Container(
                  margin: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      _addLocality();
                    },
                    child: Text("Add Locality"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
