import 'package:dinerito/src/ui/widgets/din_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../../infrastructure/helpers/enum/din_text_type.dart';
import '../../../../../widgets/din_button.dart';
import '../../../../../widgets/din_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.onSignUp,
  });

  final Future<void> Function({
    required String names,
    required String lastNames,
    required String email,
    required String password,
  }) onSignUp;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DinInput(
            title: 'Nombres',
            hintText: 'Tus nombres',
            validator: (value) {
              return _generalStringValidation(value: value);
            },
            controller: firstNameController,
          ),
          DinInput(
            title: 'Apellidos',
            hintText: 'Tus apellidos',
            validator: (value) {
              return _generalStringValidation(value: value);
            },
            controller: lastNameController,
          ),
          DinInput(
            title: 'Correo electronico',
            hintText: 'tu_correo@dominio.com',
            validator: (value) {
              return _generalStringValidation(value: value);
            },
            controller: emailController,
          ),
          DinInput(
            title: 'Contraseña',
            hintText: 'Crea una contraseña segura',
            validator: (value) {
              return _generalStringValidation(value: value);
            },
            controller: passwordController,
          ),
          const SizedBox(
            height: DinSize.small,
          ),
          DinInput(
            title: 'Confirma la contraseña',
            hintText: 'Repite la misma contraseña',
            type: DinTextType.password,
            validator: (value) {
              return _generalStringValidation(value: value);
            },
            controller: confirmPasswordController,
          ),
          const SizedBox(
            height: DinSize.small,
          ),
          const Column(
            children: [
              Row(
                children: [
                  Icon(Icons.check),
                  DinText('La contraseña debe cumplir con:'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check),
                  DinText('Al menos 8 caracteres alfanumericos.'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check),
                  DinText('Al menos 1 caracter especial.'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check),
                  DinText('Al menos 1 caracter en mayuscula.'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: DinSize.medium,
          ),
          Row(
            children: [
              Expanded(
                child: DinButton(
                  text: 'Crear',
                  onPressed: _signUp,
                  enable: enableLoginButton(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _signUp() async {
    final FormState? formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      await widget.onSignUp(
        names: firstNameController.text,
        lastNames: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  String? _generalStringValidation({
    String? value,
    String? Function(String?)? validate,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa un texto valido';
    }
    return validate != null ? validate(value) : null;
  }

  bool enableLoginButton() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
