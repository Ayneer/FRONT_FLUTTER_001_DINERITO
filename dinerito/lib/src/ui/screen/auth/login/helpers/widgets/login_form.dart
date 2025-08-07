import 'package:flutter/material.dart';

import '../../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../../infrastructure/helpers/enum/din_text_type.dart';
import '../../../../../helpers/utils.dart';
import '../../../../../widgets/din_button.dart';
import '../../../../../widgets/din_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onLogin,
  });

  final Future<void> Function({
    required String username,
    required String password,
  }) onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DinInput(
            title: 'Correo',
            hintText: 'mi_usuario@dominio.com',
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String email) => Util.emailValidator(email)
                    ? null
                    : 'Ingrese un correo valido.',
              );
            },
            controller: usernameController,
          ),
          const SizedBox(
            height: DinSize.small,
          ),
          DinInput(
            title: 'Contraseña',
            hintText: '*******',
            type: DinTextType.password,
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String password) {
                  const int minSize = Util.minPasswprdSize;
                  return password.length < minSize
                      ? 'Debe ingresar al menos $minSize caracteres en la contraseña.'
                      : null;
                },
              );
            },
            controller: passwordController,
          ),
          const SizedBox(
            height: DinSize.medium,
          ),
          Row(
            children: [
              Expanded(
                child: DinButton(
                  text: 'Ingresar',
                  onPressed: _login,
                  enable: enableLoginButton(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _login() async {
    final FormState? formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      await widget.onLogin(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  String? _generalStringValidation({
    String? value,
    String? Function(String)? validate,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa un texto valido';
    }
    return validate != null ? validate(value.trim()) : null;
  }

  bool enableLoginButton() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
