// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../models/user_dto.dart';
import '../../services/login_service.dart';
import '../../views/widgets/toast_widget.dart' as alert;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(): super(LoginInitialState()) {

    on<LoginUser>((event, emit) async {
      if (state.isActive) return;
      
      LoginService wsLogin = LoginService();
      UserDTO responseDTO = await wsLogin.loginUser(event.strUser, event.strPassword).timeout(const Duration(seconds: 5));
      
      if (responseDTO.success && responseDTO.oResponse.email.compareTo("") != 0) {
        alert.ToastAlertUtil.alertaToast("Acceso Correcto", true);
        emit(LoginSetState(true, state.user!.copyWith(
          email: responseDTO.oResponse.email,
          token: responseDTO.oResponse.token,
          expirationTime: responseDTO.oResponse.expirationTime
        )));
        return;
      }
      alert.ToastAlertUtil.alertaToast("Acceso Incorrecto", false);

    });

  }
}