import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../utils/global_util.dart' as global;
import '../../views/project/project_view.dart';
import '../../views/widgets/toast_widget.dart' as alert;



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
    final loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (_, state) {
          if (state.isActive) 
          {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => ProjectView(vStrToken: state.user!.token)
              ), 
              (Route<dynamic> route) => false,
            );
          }
        },
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
                            key: const ValueKey('frm-user'),
                            controller: ctrUsuario,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Correo/Usuario"
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          TextFormField(
                            key: const ValueKey('frm-password'),
                            controller: ctrPassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password"
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          ElevatedButton(
                            key: const ValueKey('btn-login'),
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () async {
                              loginBloc.add(LoginUser(ctrUsuario.text, ctrPassword.text));
                            },
                            child: const Text('Ingresar'),
                          ),
                        ],
                      )
                    )
                  ]
                ),
              ),
            ),
          );
        }
      )
    );
  }
}