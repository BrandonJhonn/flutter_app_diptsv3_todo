import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/project_model.dart';
import '../../utils/global_util.dart' as global;

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  static List<ProjectModel> data = [
    ProjectModel(
      id: 1234, 
      content: 'Work', 
      itemsCount: 6, 
      parentId: null, 
      children: []
    ),
    ProjectModel(
      id: 4567, 
      content: 'Home', 
      itemsCount: 0, 
      parentId: null, 
      children: []
    ),
    ProjectModel(
      id: 7645, 
      content: 'Study', 
      itemsCount: 0, 
      parentId: null, 
      children: []
    ),
    ProjectModel(
      id: 8721, 
      content: 'P-TEST-01', 
      itemsCount: 0, 
      parentId: null, 
      children: []
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROJECTS')
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              key: const ValueKey('card-detail'),
              leading: CircleAvatar(
                backgroundColor: Colors.green[700],
                child: Text(data[index].id.toString()),
              ),
              title: Text(data[index].content),
              subtitle: Text(data[index].content),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                IconButton(key: const ValueKey('btn-edit'), onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(key: const ValueKey('btn-delete'),onPressed: () {}, icon: const Icon(Icons.delete)),
              ]),
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('btn-new'),
        tooltip: 'new-project',
        child: const Icon(Icons.add),
        onPressed: () {
          /// TODO: Implement
        },
      ),
    );
  }
}