import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_diptsv3_todo/bloc/project/project_bloc.dart';
import 'package:flutter_app_diptsv3_todo/views/item/item_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../models/project_model.dart';
import '../../utils/global_util.dart' as global;

class ProjectView extends StatefulWidget {
  final String vStrToken;
  const ProjectView({ Key? key, required this.vStrToken}): super(key: key);
  
  @override
  ProjectViewState createState() => ProjectViewState();
}

class ProjectViewState extends State<ProjectView> {
  TextEditingController ctrProject = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrProject.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ctrProject.dispose();
  }

  Future<void> _showFormProjectDialog(BuildContext context, ProjectModel? vObjProject) async {
    bool isCreate = true;
    if (vObjProject != null && vObjProject.id > 0) {
      ctrProject.text = vObjProject.content;
      isCreate = false;
    }

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New Project'),
            content: TextField(
              key: const ValueKey('frm-content'),
              controller: ctrProject,
              decoration:
                  const InputDecoration(hintText: "Title of Content"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                key: const ValueKey('btn-save'),
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    BlocProvider.of<ProjectBloc>(context, listen: false).add(
                      (isCreate) 
                      ? CreateProject(widget.vStrToken, ctrProject.value.text)
                      : UpdateProject(widget.vStrToken, ctrProject.text, vObjProject!.id)
                    );
                    ctrProject.clear();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final projectBloc = BlocProvider.of<ProjectBloc>(context, listen: false);
    if (!projectBloc.state.isActive && !projectBloc.state.canEdit) {
      projectBloc.add(GetProjects(widget.vStrToken));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(key: ValueKey('page-title'), 'PROJECTS'),
      ),
      body: BlocConsumer<ProjectBloc, ProjectState>(
        bloc: BlocProvider.of<ProjectBloc>(context),
        listener: (context, state) {
          if (state.canEdit) {
            _showFormProjectDialog(context, state.project);
            return;
          }
        },
        builder: (_, state) {
          return state.isActive
          ? ListProjectBuilder(vStrToken: widget.vStrToken, data: state.lstProjects!)
          : const Center(
            child: Text("Cargando..."),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('btn-new'),
        tooltip: 'new-project',
        onPressed: () {
          _showFormProjectDialog(context, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListProjectBuilder extends StatelessWidget {
  final String vStrToken;
  final List<ProjectModel> data;

  const ListProjectBuilder({
    Key? key,
    required this.vStrToken,
    required this.data,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final projectBloc = BlocProvider.of<ProjectBloc>(context, listen: false);

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: data.length,
        itemBuilder: (_, index) => Card(
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            key: const ValueKey('card-detail'),
            leading: CircleAvatar(
              backgroundColor: Colors.green[700],
              child: Text(data[index].itemsCount.toString()),
            ),
            title: Text(key: ValueKey(data[index].content), data[index].content),
            subtitle: Text("ID: ${data[index].id}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(key: ValueKey('btn-show-${data[index].content}'), onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemView(vStrToken: vStrToken, vObjProject: data[index]),
                    ),
                  );
                  projectBloc.add(GetProjects(vStrToken));
                }, icon: const Icon(Icons.view_list), tooltip: 'Items',),
                IconButton(key: ValueKey('btn-edit-${data[index].content}'), onPressed: () {
                  projectBloc.add(EditProject(data[index]));
                }, icon: const Icon(Icons.edit), tooltip: 'Editar',),
                IconButton(key: ValueKey('btn-delete-${data[index].content}'),onPressed: () {
                  projectBloc.add(DeleteProject(vStrToken, data[index].id));
                }, icon: const Icon(Icons.delete), tooltip: 'Eliminar',),
            ]),
          ),
        ),
      )
    );
  }
}