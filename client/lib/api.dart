import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResponse {
  bool success;
  Map values;

  ApiResponse(this.success, this.values);
}

class ApiRemoteServer {
  // This connects to the remote Alfred server
  // After login - we should have a 32bit user id (uid)
  // And a 64bit security token that confirms we logged in

  int uid = 0;
  int token = 0;

  // Send a request to the server and return the response
  Future<dynamic> post(String rid,
      {required Map params, String reqType = 'post', int tryingNum = 0}) async {
    Map request = {'token': token, 'uid': uid, 'rid': rid, 'params': params};
    //printLog(request);
    try {
      var url = Uri.parse('http://10.0.2.2:3001/$rid');
      var response = await http.post(url, body: json.encode(request));
      // ignore: unrelated_type_equality_checks
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return {};
  }

  Future<dynamic> get(String rid, {int tryingNum = 0}) async {
    try {
      var url = Uri.parse('http://10.0.2.2:3001/$rid');
      var response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ApiResponse(false, Map());
  }
}

class ApiClient {
  //  This is the API that our app uses
  ApiClient._internal();

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    _singleton.apiServer = ApiRemoteServer();
    return _singleton;
  }

  late ApiRemoteServer apiServer;

  Future<Map> adminLoginWithEmailPassword(
      String adminEmail, String adminPassword) async {
    var response = await apiServer.post("adminLoginWithEmailPassword",
        params: {'email': adminEmail, 'password': adminPassword});
    return response as Map;
  }

  Future<Map> userLoginWithEmailPassword(
      String userEmail, String password) async {
    var response = await apiServer.post("userLoginWithEmailPassword",
        params: {'email': userEmail, 'password': password});
    return response as Map;
  }

  Future<void> createAdmin(String email, String password, String name,
      String locality_name, String phone, String address) async {
    await apiServer.post("createAdmin", params: {
      'email': email,
      'password': password,
      'name': name,
      'locality_name': locality_name,
      'phone': phone,
      'address': address
    });
  }

  Future<void> createUser(String email, String password, String name,
      String locality_name, String phone) async {
    await apiServer.post("createUser", params: {
      'email': email,
      'password': password,
      'name': name,
      'locality_name': locality_name,
      'phone': phone
    });
  }

  Future<void> addRecord(
      String user_id,
      String time,
      String number_of_dogs,
      String amount_spent,
      String comments,
      String locality_name,
      String date) async {
    await apiServer.post("addRecord", params: {
      'user_id': user_id,
      'time': time,
      'number_of_dogs': number_of_dogs,
      'locality_name': locality_name,
      'amount_spent': amount_spent,
      'comments': comments,
      'date': date
    });
  }

  Future<List> getRecords(String locality, String month) async {
    var response = await apiServer.post("getRecords",
        params: {'month': month, 'locality_name': locality});
    return response as List;
  }

  Future<void> addLocality(String locality_name, String number_of_dogs) async {
    await apiServer.post("addLocality", params: {
      'locality_name': locality_name,
      'estimated_dogs': number_of_dogs
    });
  }

  Future<List<String>> getLocality() async {
    var response = await apiServer.get("getLocalities");
    var newResponse = <String>[];
    (response as List).forEach((element) { 
        newResponse.add(element['locality_name'].toString());
    });
    return newResponse;
  }
}
