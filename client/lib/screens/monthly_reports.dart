import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/api.dart';
import 'package:ngo_system_for_street_dogs/widgets/main_drawer.dart';

class WeelkyReports extends StatefulWidget {
  @override
  _WeelkyReportsState createState() => _WeelkyReportsState();
}

class _WeelkyReportsState extends State<WeelkyReports> {
  List data = [];
  List users = <String>[];
  int dogCount = 0;
  int amount = 0;

  @override
  void initState() {
    super.initState();
    ApiClient().getRecords('all', 'all').then((value) {
      data = value;
      setState(() {
        data.forEach((element) {
          if (!users.contains(element['user_id'].toString())) {
            users.add(element['user_id'].toString());
          }
          dogCount=dogCount + int.parse(element['number_of_dogs'].toString());
          amount=amount+ int.parse(element['amount_spent'].toString());
        });
        print(users);
        print('No of users: ' + users.length.toString());
        print('Money: '+ amount.toString());
        print('Dogs: '+dogCount.toString());

      });
    });
  }

  String selectedLocality = 'Apple';
  String selectedMonth = '11/2021';
  List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];

  var localities = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];
  var months = ['11/2021', '12/2021', '01/2022', '02/2022', '03/2022'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly reports'),
      ),
      drawer: MainDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: selectedLocality,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: localities.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLocality = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: selectedMonth,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: months.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMonth = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ///`************************************************`///
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Monthly Report',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decorationStyle: TextDecorationStyle.dashed),
                  )
                ],
              ),

              ///`************************************************`///
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('No. of dogs fed', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(
                          dogCount.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Total Amount Spent',
                          style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(
                          amount.toString()+"/-",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Volunteers Involved',
                          style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(
                          users.length.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(2),
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30,
                          child: Center(child: Text('user with id: ${users[index]}')),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
