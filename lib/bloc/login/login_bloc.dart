import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../services/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(): super(LoginInitialState()) {

    on<LoginUser>((event, emit) async {
      if (state.isActive) return;
      
      LoginService wsLogin = LoginService();
      final response = await wsLogin.loginUser(event.strUser, event.strPassword);
      
      emit(LoginSetState(state.user!.copyWith(
        email: response.email,
        token: response.token,
        expirationTime: response.expirationTime
      )));
    });

  }
}