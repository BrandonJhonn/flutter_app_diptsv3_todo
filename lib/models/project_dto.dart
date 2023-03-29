import 'package:flutter_app_diptsv3_todo/models/project_model.dart';

class ProjectDTO {
  String strMessage;
  bool success;
  List<ProjectModel> oResponse;

  ProjectDTO({
    required this.strMessage,
    required this.success,
    required this.oResponse
  });
}