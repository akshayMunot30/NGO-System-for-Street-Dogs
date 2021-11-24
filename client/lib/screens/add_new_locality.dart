import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/widgets/customInput.dart';

class AddNewLocality extends StatelessWidget {
  static const routName = '/addNewLocality';

  @override
  Widget build(BuildContext context) {
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
                CustomInput(
                  hintText: "New Locality Name",
                  isPasswordField: false,
                ),
                SizedBox(height: 10,),
                CustomInput(
                  hintText: "Estimated Number of Dogs",
                  isPasswordField: false,
                ),
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
