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
  final records = db.collection('Record');
  final locality = db.collection('Locality');

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
    return data ?? <String, String>{};
  });

  app.post('/userLoginWithEmailPassword', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();
    
    var data = await user.findOne({'email': email, 'password': password});
    print(data);
    return data ?? <String, String>{};
  });

  app.post('/createAdmin', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var email = params['email'].toString();
    var password = params['password'].toString();
    var name = params['name'].toString();
    var address = params['address'].toString();
    var phone = params['phone'].toString();
    var locality = params['locality_name'].toString();

    // ignore: unawaited_futures
    admin.insert({
      'email': email,
      'locality_name': locality,
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
    var locality = params['locality_name'].toString();

    var count = (await user.find().toList()).length;

    // ignore: unawaited_futures
    user.insert({
      'email': email,
      'locality_name': locality,
      'name': name,
      'password': password,
      'phone': phone,
      'user_id': (count + 1).toString()
    });

    // use user_id, name, email, password, locality_id, phone
    // and add the user in the user collections
  });

  app.post('/addRecord', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var locality = params['locality_name'].toString();
    var date = params['date'].toString();
    var user_id = params['user_id'].toString();
    var time = params['time'].toString();
    var number_of_dogs = params['number_of_dogs'].toString();
    var amount_spent = params['amount_spent'].toString();
    var comments = params['comments'].toString();
    var month = date.substring(3, date.length);
    // ignore: unawaited_futures
    records.insert({
      'user_id': user_id,
      'date': date,
      'time': time,
      'locality_name': locality,
      'amount_spent': amount_spent,
      'comments': comments,
      'number_of_dogs': number_of_dogs,
      'month': month
    });
  });

  app.post('/getRecords', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var month = params['month'].toString();
    var locality = params['locality_name'].toString();
    if (month == 'all' && locality == 'all') {
      return await records.find().toList();
    } else {
      if (month == 'all') {
        return await records.find({'locality_name': locality}).toList();
      } else if (locality == 'all') {
        return await records.find({'month': month}).toList();
      } else {
        return await records
            .find({'month': month, 'locality_name': locality}).toList();
      }
    }
  });

  app.post('/addLocality', (req, res) async {
    final body = await parseBodyIntoJson(req);
    final params = parseParamsFromBody(body);
    var dogs = params['estimated_dogs'].toString();
    var locality_name = params['locality_name'].toString();

    // ignore: unawaited_futures
    locality.insert({'locality_name': locality_name, 'estimated_dogs': dogs});
  });

  app.get('/getLocalities', (req, res) async {
    return await locality.find().toList();
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
