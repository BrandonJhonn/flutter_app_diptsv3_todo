part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final String strUser;
  final String strPassword;
  LoginUser(this.strUser, this.strPassword);
}