import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastAlertUtil {
  static void alertaToast(String msg, bool? tipo) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: (tipo != null) ? (tipo) ? Colors.green[400] : Colors.red[400] : Colors.blue[400],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}