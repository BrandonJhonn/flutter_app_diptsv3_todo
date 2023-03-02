import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';
import 'views/login/login_view.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoApp',
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginView()
        }
      )
    );
  }
}
