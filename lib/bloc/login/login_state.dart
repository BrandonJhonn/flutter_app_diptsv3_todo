part of 'login_bloc.dart';

@immutable
abstract class LoginState {

  final bool isActive;
  final UserModel? user;

  const LoginState({
    this.isActive = false, 
    this.user
  });

}

class LoginInitialState extends LoginState {
  LoginInitialState(): super(
    isActive: false, 
    user: UserModel(email: "", token: "", expirationTime: DateTime.now()));
}

class LoginSetState extends LoginState {
  final bool status;
  final UserModel newUser;
  const LoginSetState(this.status, this.newUser)
  :super (isActive: status, user: newUser);
}