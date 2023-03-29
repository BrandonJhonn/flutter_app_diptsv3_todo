import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import '../models/user_dto.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

import '../utils/global_util.dart' as global;

class LoginService
{
  Future<UserDTO> loginUser(String vStrUser, String vStrPassword) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);

      String strBasicAuth = "Basic ";
      strBasicAuth += base64.encode(utf8.encode('$vStrUser:$vStrPassword'));

      final http.Response response = await http.get(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/authentication/token.json'),
        headers: <String, String>{'authorization' : strBasicAuth}
      );

      if (response.statusCode == 200) {
        return UserDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: UserModel.fromJson(jsonDecode(response.body)));
      } else {
        return UserDTO(
          strMessage: "Error WS", 
          success: false, 
          oResponse: UserModel.fromJson({}));
      }

    } on PlatformException catch (e) {
      return UserDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: UserModel.fromJson({}));
    }
  }
}
