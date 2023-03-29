part of 'project_bloc.dart';

abstract class ProjectEvent {}

class GetProjects extends ProjectEvent {
  final String strToken;
  GetProjects(this.strToken);
}

class SelectProject extends ProjectEvent {
  final ProjectModel project;
  SelectProject(this.project);
}

class EditProject extends ProjectEvent {
  final ProjectModel project;
  EditProject(this.project);
}

class CreateProject extends ProjectEvent {
  final String strToken;
  final String strContent;
  CreateProject(this.strToken, this.strContent);
}

class UpdateProject extends ProjectEvent {
  final String strToken;
  final String strContent;
  final int vIdProject;
  UpdateProject(this.strToken, this.strContent, this.vIdProject);
}

class DeleteProject extends ProjectEvent {
  final String strToken;
  final int vIdProject;
  DeleteProject(this.strToken, this.vIdProject);
}