import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../utils/global_util.dart' as global;

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return state.isActive
          ? Center(
            child: Column(
              children: [
                Text(state.user!.email),
                Text(state.user!.token),
                Text(state.user!.expirationTime.toString())
              ]
            ),
          )
          : const Center(
            child: Text('No existe informacion de Usuario'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('login'),
        tooltip: 'login',
        child: const Icon(Icons.arrow_circle_up),
        onPressed: () {
          loginBloc.add(LoginUser(stringToBase64.decode(global.USER), stringToBase64.decode(global.PASSWORD)));
        },
      ),
    );
  }
}