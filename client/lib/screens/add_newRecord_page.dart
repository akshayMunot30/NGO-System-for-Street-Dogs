import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ngo_system_for_street_dogs/screens/homepage_volunteer.dart';
import 'package:ngo_system_for_street_dogs/widgets/maindrawer_volunteer.dart';

import '../api.dart';

class AddNewRecord extends StatefulWidget {
  @override
  _AddNewRecordState createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  String dropDownValue = "Pune";
  var localities = <String>['Pune'];
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

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

  TextEditingController _location = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  TextEditingController _volunteerId = new TextEditingController();
  TextEditingController _time = new TextEditingController();
  TextEditingController _dogsFed = new TextEditingController();
  TextEditingController _amount = new TextEditingController();
  TextEditingController _comments = new TextEditingController();

  void _submitReport() {
    ApiClient().addRecord(_volunteerId.text, _time.text, _dogsFed.text,
        _amount.text, _comments.text, _location.text, _date.text);
    _location.clear();
    _date.clear();
    _volunteerId.clear();
    _time.clear();
    _dogsFed.clear();
    _amount.clear();
    _comments.clear();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Added Successfully',
          style: TextStyle(color: Colors.green),
        ),
        content: const Text('New Record has been Added!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => VolunteerHome(),
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
        title: Text('Add a new Record'),
      ),
      drawer: MainDrawer_volunteer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    width: 170,
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
                  Container(
                    width: 170,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: SizedBox(
                      height: 55,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(style: BorderStyle.solid),
                          primary: Colors.black,
                          backgroundColor: Color(0xFFF2F2F2),
                          shadowColor: Colors.black,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(200),
                            lastDate: DateTime(2050),
                          ).then((value) {
                            setState(() {
                              date = value!;
                              _date.text =
                                  DateFormat('dd/MM/yyyy').format(date);
                            });
                          });
                        },
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(date),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 170,
                        margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextField(
                          controller: _volunteerId,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Volunteer ID",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 10),
                        width: 170,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(style: BorderStyle.solid),
                              primary: Colors.black,
                              backgroundColor: Color(0xFFF2F2F2),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                setState(() {
                                  time = value!;
                                  _time.text = value.toString();
                                });
                              });
                            },
                            child: Text(
                              '$time',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 170,
                        margin: EdgeInsets.only(left: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextField(
                          controller: _dogsFed,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Number of Dogs fed",
                          ),
                        ),
                      ),
                      Container(
                        width: 170,
                        margin: EdgeInsets.only(left: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextField(
                          controller: _amount,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ammount Spent",
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(7.0),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: TextField(
                controller: _comments,
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      "Any special AID or note you would like to mention.",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _submitReport();
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
