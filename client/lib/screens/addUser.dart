import 'package:flutter/material.dart';
import '../api.dart';
import '../screens/homepage_admin.dart';

class AddVolunteer extends StatefulWidget {
  const AddVolunteer({Key? key}) : super(key: key);

  @override
  _AddVolunteerState createState() => _AddVolunteerState();
}

class _AddVolunteerState extends State<AddVolunteer> {
  String dropDownValue = "Pune";
  var localities = <String>['Pune'];
  @override
  void initState() {
    super.initState();
    ApiClient().getLocality().then((value) {
      setState(() {
        localities = value;
        localities.remove('all');
      });
    });
  }

  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void _addUser() {
    ApiClient().createUser(
        _email.text, _password.text, _name.text, _location.text, _phone.text);
    _location.clear();
    _name.clear();
    _phone.clear();
    _email.clear();
    _location.clear();
    _password.clear();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'User Created Successfully!!',
          style: TextStyle(color: Colors.green),
        ),
        content: const Text('The User can now login trhough Vlunteer Login'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New Volunteer"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 180,
                  child: Image.asset("assets/images/addVolunteer.png"),
                ),

                // Full Name Input Field
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
                    controller: _name,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
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

                // Phone Number Input Field
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
                    keyboardType: TextInputType.phone,
                    controller: _phone,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
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

                // Locality Name
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  width: 330,
                  margin: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropDownValue,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 0.5,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                        _location.text = newValue;
                      });
                    },
                    items: localities
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                // Email Input Field
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
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email ID",
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

                // Password Field
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: _password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
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

                // Submit Button
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print("Name" + _name.text);
                      print("Phone" + _phone.text);
                      print("Locality" + _location.text);
                      print("Email" + _email.text);
                      print("Password" + _password.text);

                      _addUser();
                    },
                    child: Text("Submit"),
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
