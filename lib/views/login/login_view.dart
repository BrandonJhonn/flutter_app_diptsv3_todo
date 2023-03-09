import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../utils/global_util.dart' as global;



class LoginView extends StatefulWidget {
  const LoginView({super.key});
  
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  TextEditingController ctrUsuario = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrUsuario.addListener(() {});
    ctrPassword.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ctrUsuario.dispose();
    ctrPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                height: height,
                width: width,
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      global.APP_ICON,
                      height: 105,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: ctrUsuario,
                            decoration: const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          TextFormField(
                            controller: ctrPassword,
                            obscureText: true,
                            decoration: const InputDecoration(border: OutlineInputBorder()),
                          ),
                        ],
                      )
                    )
                  ]
                ),
              ),
            ),
          );
        },
      )
    );
  }
}