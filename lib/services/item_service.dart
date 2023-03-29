import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_app_diptsv3_todo/models/item_dto.dart';
import 'package:flutter_app_diptsv3_todo/models/item_model.dart';
import 'package:http/http.dart' as http;

import '../utils/global_util.dart' as global;

class ItemService {

  Future<ItemDTO> getItems(String vStrToken) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      final http.Response response = await http.get(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/items.json'),
        headers: <String, String>{'token' : vStrToken}
      );
      if (response.statusCode == 200) {

        var lstItems = jsonDecode(response.body) as List;
        
        return ItemDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstItems.map((item) => ItemModel.fromJson(item)).toList());
        } else {
          return ItemDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ItemDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ItemDTO> postItem(String vStrToken, String vStrContent, int vIdProject) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      
      final http.Response response = await http.post(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/items.json'),
        headers: <String, String>{'token' : vStrToken},
        body: jsonEncode(<String, dynamic>{
          'Content': vStrContent,
          'ItemType': 1,
          'Checked': false,
          'ProjectId': vIdProject
        }),
      );

      if (response.statusCode == 200) {

        List<ItemModel> lstItems = [];
        lstItems.add(ItemModel.fromJson(jsonDecode(response.body)));

        return ItemDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstItems);
        } else {
          return ItemDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ItemDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ItemDTO> putItem(String vStrToken, String vStrContent, bool vIsComplete, int vIdItem) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      
      final http.Response response = await http.put(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/items/$vIdItem.json'),
        headers: <String, String>{'token' : vStrToken},
        body: jsonEncode(<String, dynamic>{
          'Content': vStrContent,
          'Checked': vIsComplete
        }),
      );

      if (response.statusCode == 200) {

        List<ItemModel> lstItems = [];
        lstItems.add(ItemModel.fromJson(jsonDecode(response.body)));

        return ItemDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstItems);
        } else {
          return ItemDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ItemDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ItemDTO> deleteItem(String vStrToken, int vIdItem) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      
      final http.Response response = await http.delete(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/items/$vIdItem.json'),
        headers: <String, String>{'token' : vStrToken}
      );

      if (response.statusCode == 200) {

        List<ItemModel> lstItems = [];
        lstItems.add(ItemModel.fromJson(jsonDecode(response.body)));

        return ItemDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstItems);
        } else {
          return ItemDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ItemDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

}