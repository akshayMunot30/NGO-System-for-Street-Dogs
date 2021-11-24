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
  Future<ApiResponse> post(String rid,
      {required Map params, String reqType = 'post', int tryingNum = 0}) async {
    Map request = {'token': token, 'uid': uid, 'rid': rid, 'params': params};
    //printLog(request);
    try {
      var url = Uri.parse('http://10.0.2.2:3000/$rid');
      var response = await http.post(url, body: json.encode(request));
      print(response.body);
      //printLog(response.statusCode);
      // Success, return map of json response
      if (response.statusCode == 200) {
        return ApiResponse(true, jsonDecode(response.body));
      }
      // Failure
      return ApiResponse(false, Map());
    } catch (e) {
      print(e.toString());
    }
    return ApiResponse(false, Map());
  }

  Future<ApiResponse> get(String rid, {int tryingNum = 0}) async {
    try {
      var url = Uri.parse('http://10.0.2.2:3000/$rid');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return ApiResponse(true, jsonDecode(response.body));
      }
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

  /// Login Methods
  /// Normal Login (using Email and password)
  /// Same for Quick Logins as Well
  Future<ApiResponse> adminLoginWithEmailPassword(
      String userEmail, String password) async {
    var response = await apiServer.post("adminLoginWithEmailPassword",
        params: {'email': userEmail, 'password': password});
    //printLog(response.success);
    Map map = response.values;
    // printLog(map);
    if (map['status'] == 'success') {
      return ApiResponse(true, map);
    } else {
      return ApiResponse(false, Map());
    }
  }
}