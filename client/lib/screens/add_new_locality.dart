import 'package:flutter/material.dart';

class AddNewLocality extends StatelessWidget {
  static const routName = '/addNewLocality';

  @override
  Widget build(BuildContext context) {
    TextEditingController _newLocality = new TextEditingController();
    TextEditingController _estimatedDogs = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Locality'),
      ),
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
                      hintText: "Address",
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
                    controller: _estimatedDogs,
                    minLines: 1,
                    maxLines: 4,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
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
                    onPressed: () {},
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
