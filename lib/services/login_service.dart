import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_diptsv3_todo/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../utils/global_util.dart' as global;

class LoginService
{
  Future<UserModel> loginUser(String vStrUser, String vStrPassword) async {
    try {

      String strBasicAuth = "Basic ";
      strBasicAuth += base64.encode(utf8.encode('$vStrUser:$vStrPassword'));

      final http.Response response = await http.get(
        Uri.https(global.WS_URL, '/api/authentication/token.json'),
        headers: <String, String>{'authorization' : strBasicAuth}
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return UserModel.fromJson({});
      }

    } on PlatformException catch (e) {
      rethrow;
    }
  }
}
