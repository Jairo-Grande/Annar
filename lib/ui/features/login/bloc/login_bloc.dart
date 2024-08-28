import 'package:annar_app/data/model/login_model.dart';
import 'package:annar_app/domain/use_cases/get_annar_api.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetAnnarApi getAnnarApi;
  LoginBloc(this.getAnnarApi) : super(const LoginState()) {
    on<LoginButtonPressed>(_login);
    on<SaveToken>(_saveToken);
  }

  _login(LoginButtonPressed event, Emitter emit) async {
    try {
      emit(LoginLoading());
      final response = await getAnnarApi.login(event.username, event.password);
      response.fold((failure) {
        emit(const LoginFailure('Usuario o contraseña incorrectos'));
      }, (login) {
        if (login.estado == false) {
          emit(const LoginFailure(
              'Error al iniciar sesión, revise sus credenciales.'));
        } else {
          add(SaveToken(token: login.token!));
          emit(LoginSuccess(login: login,userName: event.username));
        }
      });
    } catch (e) {
      emit(const LoginFailure('Error al iniciar sesión'));
    }
  }

  _saveToken(SaveToken event, Emitter emit) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: event.token);
  }
}
