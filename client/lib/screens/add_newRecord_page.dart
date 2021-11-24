import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewRecord extends StatefulWidget {
  @override
  _AddNewRecordState createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  String dropDownValue = "Location";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new Record'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
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
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Location',
                          'Pune',
                          'Mumbai',
                          'Amravati'
                        ].map<DropdownMenuItem<String>>((String value) {
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
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black, side: BorderSide(color: Colors.black,),),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(200),
                            lastDate: DateTime(2050),
                          ).then((value) {
                            setState(() {
                              date = value!;
                            });
                          });
                        },
                        child: Text(
                          DateFormat('yMMMMd').format(date),
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
                          margin: EdgeInsets.only(left: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "ID",
                              labelText: "Volunteer ID",
                            ),
                          ),
                        ),
                        Container(
                          width: 170,
                          margin: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                setState(() {
                                  time = value!;
                                });
                              });
                            },
                            child: Text(
                              '$time',
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
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "eg. 1, 2, 3...",
                              labelText: "Dogs fed",
                            ),
                          ),
                        ),
                        Container(
                          width: 170,
                          margin: EdgeInsets.only(left: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Rs.",
                              labelText: "Ammount Spent",
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
                  borderRadius: BorderRadius.circular(7.0),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText:
                        "Any special AID or note you would like to mention.",
                    labelText: "Any other Points",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //....
                      },
                      child: Text("Submit"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewRecord(),
                          ),
                        );
                      },
                      child: Text("clear"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
