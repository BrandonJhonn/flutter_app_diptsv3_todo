// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/project_model.dart';
import '../../models/project_dto.dart';
import '../../services/project_service.dart';
import '../../views/widgets/toast_widget.dart' as alert;

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectService wsProject = ProjectService();

  ProjectBloc(): super(ProjectInitialState()) {

    on<GetProjects>((event, emit) async {

      ProjectDTO responseDTO = await wsProject.getProject(event.strToken)
                                              .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Carga Correcta", true);
        emit(ProjectSetState(true, responseDTO.oResponse));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });

    on<SelectProject>((event, emit) {
      if (state.isActive) {
        emit(ProjectSelectedItem(true, event.project.copyWith(
          id: event.project.id,
          content: event.project.content,
          itemsCount: event.project.itemsCount,
          parentId: event.project.parentId,
          children: event.project.children
        )));
      }
    });

    on<EditProject>((event, emit) {
      if (state.isActive) {
        emit(ProjectCanEditItem(true, event.project.copyWith(
          id: event.project.id,
          content: event.project.content,
          itemsCount: event.project.itemsCount,
          parentId: event.project.parentId,
          children: event.project.children
        )));
      }
    });

    on<CreateProject>((event, emit) async {
      ProjectDTO responseDTO = await wsProject.postProject(event.strToken, event.strContent)
                                              .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Correcto", true);
        add(GetProjects(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);
    });

    on<UpdateProject>((event, emit) async {

      ProjectDTO responseDTO = await wsProject.putProject(event.strToken, event.strContent, event.vIdProject)
                                              .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Actualizado", true);
        add(GetProjects(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });

    on<DeleteProject>((event, emit) async {

      ProjectDTO responseDTO = await wsProject.deleteProject(event.strToken, event.vIdProject)
                                              .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Eliminado", null);
        add(GetProjects(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });
  }
}