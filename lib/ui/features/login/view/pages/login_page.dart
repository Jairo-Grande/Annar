import 'package:annar_app/ui/features/login/bloc/login_bloc.dart';
import 'package:annar_app/ui/features/login/view/widgets/custom_button.dart';
import 'package:annar_app/ui/features/login/view/widgets/custom_textfield.dart';
import 'package:annar_app/utils/alerts/error_alert_dialog.dart';
import 'package:annar_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final ValueNotifier<bool> _isButtonEnable = ValueNotifier(false);

  @override
  void initState() {
_usernameController.addListener(_updateButtonState);
_passwordController.addListener(_updateButtonState);

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _isButtonEnable.dispose();
    super.dispose();
  }


   void _updateButtonState() {
    final isFormValid = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    _isButtonEnable.value = isFormValid;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushNamed(context, Routes.home);
              }
              if (state is LoginFailure) {
                errorAlertDialog(
                    buttonText: 'intentar de nuevo',
                    error: state.error,
                    context: context,
                    iconData: Icons.error);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(Assets.loginImage),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textController: _usernameController,
                    labelText: 'Ingrese su usuario',
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      textController: _passwordController,
                      labelText: 'Ingrese su contraseña',
                      icon: Icons.password),
                  const SizedBox(
                    height: 180,
                  ),
                   ValueListenableBuilder<bool>(
                    valueListenable: _isButtonEnable,
                    builder: (context, isEnabled, child) {
                      return CUstomButton(
                        onPressed: isEnabled
                            ? () {
                                context.read<LoginBloc>().add(LoginButtonPressed(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ));
                              }
                            : null, // Deshabilitar el botón si no es válido
                        color: isEnabled ? Colors.blue : Colors.grey,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
