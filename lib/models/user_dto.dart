import 'package:flutter_app_diptsv3_todo/models/user_model.dart';

class UserDTO {
  String strMessage;
  bool success;
  UserModel oResponse;
  
  UserDTO({
    required this.strMessage,
    required this.success,
    required this.oResponse
  });
}