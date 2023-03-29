part of 'project_bloc.dart';

abstract class ProjectState {

  final bool isActive;
  final bool isSelected;
  final bool canEdit;
  final ProjectModel? project;
  final List<ProjectModel>? lstProjects;

  const ProjectState({
    this.isActive = false,
    this.isSelected = false,
    this.canEdit = false,
    this.project,
    this.lstProjects
  });
}

class ProjectInitialState extends ProjectState {
  ProjectInitialState(): super(
    isActive: false,
    isSelected: false,
    canEdit: false,
    project: ProjectModel(
      id: 0, 
      content: "",
      itemsCount: 0,
      parentId: 0,
      children: []),
    lstProjects: []
  );
}

class ProjectSetState extends ProjectState {
  final bool status;
  final List<ProjectModel> newLstProject;
  const ProjectSetState(this.status, this.newLstProject)
  :super (isActive: status, lstProjects: newLstProject);
}

class ProjectSelectedItem extends ProjectState {
  final bool selected;
  final ProjectModel itemProject;
  const ProjectSelectedItem(this.selected, this.itemProject)
  :super (isSelected: selected, canEdit: !selected, project: itemProject);
}

class ProjectCanEditItem extends ProjectState {
  final bool editing;
  final ProjectModel itemProject;
  const ProjectCanEditItem(this.editing, this.itemProject)
  :super (isSelected: !editing, canEdit: editing, project: itemProject);
}