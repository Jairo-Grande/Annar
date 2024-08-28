part of 'login_bloc.dart';

 class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginModel login;
  String userName;
  LoginSuccess({required this.login,required this.userName});
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);
}
