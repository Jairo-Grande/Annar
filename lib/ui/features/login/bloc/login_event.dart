part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    required this.username,
    required this.password,
  });
}

class SaveToken extends LoginEvent {
  final String token;
  const SaveToken({required this.token});
}
