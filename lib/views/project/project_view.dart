import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/global_util.dart' as global;

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project')
      ),
      body: const Center(
        child: Text('Project List'),
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