import 'package:flutter/material.dart';
import 'package:ngo_system_for_street_dogs/api.dart';
import 'package:ngo_system_for_street_dogs/widgets/main_drawer.dart';

class MonthlyReport extends StatefulWidget {
  @override
  _MonthlyReportState createState() => _MonthlyReportState();
}

class _MonthlyReportState extends State<MonthlyReport> {
  List data = [];
  List users = <String>[];
  int dogCount = 0;
  int amount = 0;

  @override
  void initState() {
    super.initState();
    ApiClient().getLocality().then((value) => localities = value);
    ApiClient().getRecords('all', 'all').then((value) {
      data = value;
      setState(() {
        data.forEach((element) {
          if (!users.contains(element['user_id'].toString())) {
            users.add(element['user_id'].toString());
          }
          dogCount = dogCount + int.parse(element['number_of_dogs'].toString());
          amount = amount + int.parse(element['amount_spent'].toString());
        });
      });
    });
  }

  String selectedLocality = 'all';
  String selectedMonth = 'all';
  List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];

  var localities = ['all'];
  var months = [
    'all',
    '01/2021',
    '02/2021',
    '03/2021',
    '04/2021',
    '05/2021',
    '06/2021',
    '07/2021',
    '08/2021',
    '09/2021',
    '10/2021',
    '11/2021',
    '12/2021',
    '01/2022',
    '02/2022',
    '03/2022'
  ];

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
                    width: 140,
                    decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(7.0)),
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
                              selectedLocality = newValue!;
                              // set all count to 0 and then update
                              data = [];
                              users = <String>[];
                              dogCount = 0;
                              amount = 0;
                              ApiClient()
                                  .getRecords(selectedLocality, selectedMonth)
                                  .then((value) {
                                data = value;
                                setState(() {
                                  data.forEach((element) {
                                    if (!users.contains(
                                        element['user_id'].toString())) {
                                      users.add(element['user_id'].toString());
                                    }
                                    dogCount = dogCount +
                                        int.parse(element['number_of_dogs']
                                            .toString());
                                    amount = amount +
                                        int.parse(
                                            element['amount_spent'].toString());
                                  });
                                });
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(7.0),
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
                                // set all count to 0 and then update
                                data = [];
                                users = <String>[];
                                dogCount = 0;
                                amount = 0;
                                ApiClient()
                                    .getRecords(selectedLocality, selectedMonth)
                                    .then((value) {
                                  data = value;
                                  setState(() {
                                    data.forEach((element) {
                                      if (!users.contains(
                                          element['user_id'].toString())) {
                                        users
                                            .add(element['user_id'].toString());
                                      }
                                      dogCount = dogCount +
                                          int.parse(element['number_of_dogs']
                                              .toString());
                                      amount = amount +
                                          int.parse(element['amount_spent']
                                              .toString());
                                    });
                                  });
                                });
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
                height: 40,
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
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No. of dogs fed',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                        alignment: Alignment.centerLeft,
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(),
                        ),
                        child: Text(
                          dogCount.toString(),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Total Amount Spent',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                        alignment: Alignment.centerLeft,
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(),
                        ),
                        child: Text(
                          amount.toString() + "/-",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Volunteers Involved',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,),),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                        alignment: Alignment.centerLeft,
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(),
                        ),
                        child: Text(
                          users.length.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(2),
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30,
                          child: Center(
                              child: Text('User with ID: ${users[index]}')),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 110,
              ),
              Center(
                child: Text(
                  "\"A dog doesn\'t care if you\'re rich or poor, \neducated or illiterate, clever or dull.\nGive him your heart and he will give you his.\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
