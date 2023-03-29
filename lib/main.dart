import 'package:flutter/material.dart';
import 'package:flutter_app_diptsv3_todo/bloc/item/item_bloc.dart';
import 'package:flutter_app_diptsv3_todo/models/project_model.dart';
import 'package:flutter_app_diptsv3_todo/views/item/item_view.dart';
import 'package:flutter_app_diptsv3_todo/views/project/project_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/project/project_bloc.dart';
import 'views/login/login_view.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => ProjectBloc()),
        BlocProvider(create: (_) => ItemBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoApp',
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginView(),
          'project': (_) => const ProjectView(vStrToken: "",),
          'item': (_) => ItemView(
            vStrToken: "", 
            vObjProject: ProjectModel(
              id: 0,
              content: "",
              itemsCount: 0,
              parentId: 0,
              children: []),
          )
        }
      )
    );
  }
}
