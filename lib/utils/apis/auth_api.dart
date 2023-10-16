import 'dart:convert';
import 'dart:developer';

import 'package:demo_mobile/models/profile_model.dart';
import 'package:demo_mobile/models/user_model.dart';
import 'package:demo_mobile/utils/apis/api.dart';

import 'package:http/http.dart' as http;

class AuthAPI extends API {
  Future checkTokenAPI(String token) async {
    try {
      var jsonData;
      var headers = {
        "Authorization": "Bearer $token",
      };

      var data = await http.post(
        Uri.parse(profileUrl),
        headers: headers,
      );
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        return ProfileModel.fromJson(jsonData);
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<UserModel?> loginAPI(String username, String password) async {
    var jsonData;
    try {
      var data = await http.post(
        Uri.parse(baseUrl),
        body: {'username': username, 'password': password},
      );

      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        log("Login Success");
        return UserModel.fromJson(jsonData);
      } else {
        log("${data.body} Status Code = ${data.statusCode}");
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future logoutApi(String token) async {
    var jsonData;
    try {
      var headers = {
        "Authorization": "Bearer $token",
      };

      var data = await http.post(
        Uri.parse(logoutUrl),
        headers: headers,
      );

      jsonData = json.decode(data.body);
      log(jsonData.toString());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<ProfileModel?> profileApi(String token) async {
    var jsonData;
    try {
      var headers = {
        "Authorization": "Bearer $token",
      };

      var data = await http.post(
        Uri.parse(profileUrl),
        headers: headers,
      );

      jsonData = json.decode(data.body);
      return ProfileModel.fromJson(jsonData);
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
