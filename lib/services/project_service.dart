import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_app_diptsv3_todo/models/project_dto.dart';
import 'package:flutter_app_diptsv3_todo/models/project_model.dart';
import 'package:http/http.dart' as http;

import '../utils/global_util.dart' as global;

class ProjectService {

  Future<ProjectDTO> getProject(String vStrToken) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      final http.Response response = await http.get(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/projects.json'),
        headers: <String, String>{'token' : vStrToken}
      );
      if (response.statusCode == 200) {

        var lstProjects = jsonDecode(response.body) as List;
        
        return ProjectDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstProjects.map((item) => ProjectModel.fromJson(item)).toList());
        } else {
          return ProjectDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ProjectDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ProjectDTO> postProject(String vStrToken, String vStrContent) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      Random random = Random();
      final http.Response response = await http.post(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/projects.json'),
        headers: <String, String>{'token' : vStrToken},
        body: jsonEncode(<String, dynamic>{
          'Content': vStrContent,
          'Icon': (random.nextInt(10) + 1),
        }),
      );

      if (response.statusCode == 200) {

        List<ProjectModel> lstProjects = [];
        lstProjects.add(ProjectModel.fromJson(jsonDecode(response.body)));

        return ProjectDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstProjects);
        } else {
          return ProjectDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ProjectDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ProjectDTO> putProject(String vStrToken, String vStrContent, int vIdProject) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      
      final http.Response response = await http.put(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/projects/$vIdProject.json'),
        headers: <String, String>{'token' : vStrToken},
        body: jsonEncode(<String, dynamic>{
          'Content': vStrContent
        }),
      );

      if (response.statusCode == 200) {

        List<ProjectModel> lstProjects = [];
        lstProjects.add(ProjectModel.fromJson(jsonDecode(response.body)));

        return ProjectDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstProjects);
        } else {
          return ProjectDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ProjectDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

  Future<ProjectDTO> deleteProject(String vStrToken, int vIdProject) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      
      final http.Response response = await http.delete(
        Uri.https(stringToBase64.decode(global.WS_URL), '/api/projects/$vIdProject.json'),
        headers: <String, String>{'token' : vStrToken}
      );

      if (response.statusCode == 200) {

        List<ProjectModel> lstProjects = [];
        lstProjects.add(ProjectModel.fromJson(jsonDecode(response.body)));

        return ProjectDTO(
          strMessage: "Correcto",
          success: true,
          oResponse: lstProjects);
        } else {
          return ProjectDTO(
            strMessage: "Error WS", 
            success: false, 
            oResponse: []);
        }

    } on PlatformException catch (e) {
      return ProjectDTO(
          strMessage: "Error: \n${e.message}", 
          success: false, 
          oResponse: []);
    }
  }

}