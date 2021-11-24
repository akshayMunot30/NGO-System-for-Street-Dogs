import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main(List<String> arguments) async {
  final app = Alfred();
  final db = await Db.create(
      'mongodb+srv://akshaymunot30:akshay@cluster0.ozpyp.mongodb.net/ngo?retryWrites=true&w=majority');

  await db.open();
  final coll = db.collection('test');
  final user = db.collection('User');
  final admin = db.collection('Admin');

  app.get('/testDb', (req, res) async {
    var data = await coll.find().toList();
    return data;
  });

  app.post('/adminLoginWithEmailPassword', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();

    var data = await admin.findOne({'email': email, 'password': password});
    print(data);
    return data;
  });

  app.post('/userLoginWithEmailPassword', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();
    var data = await user.findOne({'email': email, 'password': password});

    return data ?? {};
  });

  app.post('/createAdmin', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();
    var name = params['name'].toString();
    var address = params['address'].toString();
    var phone = params['phone'].toString();

    // ignore: unawaited_futures
    admin.insert({
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'address': address
    });
  });

  app.post('/createUser', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();
    var name = params['name'].toString();
    var phone = params['phone'].toString();
    var locality_id = params['locality_id'].toString();

    var count = (await user.find().toList()).length;


    // ignore: unawaited_futures
    user.insert({
      'email': email,
      'locality_id': locality_id,
      'name': name,
      'password': password,
      'phone': phone,
      'user_id': (count+1).toString()
    });

    // use user_id, name, email, password, locality_id, phone
    // and add the user in the user collections
  });

  app.post('/addRecord', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var locality = params['locality'].toString();
    var date = params['date'].toString();
    var user_id = params['user_id'].toString();
    var time = params['time'].toString();
    var number_of_dogs = params['number_of_dogs'].toString();
    var amount_spent = params['amount_spent'].toString();
    var comments = params['comments'].toString();

    // use the details to add them in both the collections
    // 1 records with all the details
    // 2 in monthly records with only the record id
  });

  app.post('/getMonthlyRecords', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var month = params['month'].toString();
    // retun the records for the month from the db
  });

  await app.listen(3000); //Listening on port 3001
}

Map<dynamic, dynamic> parseParamsFromBody(Map<String, dynamic> body) =>
    body['params'] as Map;

Future<Map<String, dynamic>> parseBodyIntoJson(HttpRequest req) async {
  final json = await utf8.decoder.bind(req).join();
  final body = jsonDecode(json) as Map<String, dynamic>;
  return body;
}
