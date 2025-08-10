import 'package:dinerito/src/ui/helpers/widgets/din_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../infrastructure/helpers/din_colors.dart';
import '../../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../../infrastructure/helpers/enum/din_text_type.dart';
import '../../../../../helpers/notifiers/app_notifier.dart';
import '../../../../../helpers/utils.dart';
import '../../../../../helpers/widgets/din_button.dart';
import '../../../../../helpers/widgets/din_input.dart';

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
  bool goodPassSize = false;
  bool goodSpecialCharacter = false;
  bool goodCapitalLetter = false;
  bool enableBtnCreate = false;

  @override
  Widget build(BuildContext context) {
    final AppNotifier appNotifier = context.watch<AppNotifier>();
    final bool isLoading = appNotifier.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DinInput(
            title: 'Nombres',
            hintText: 'Tus nombres',
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String names) {
                  final List<String> allNames = names.split(' ');
                  for (var name in allNames) {
                    if (!Util.onlyStringValidator(name)) {
                      return 'Ingrese nombres validos, sin caracteres especiales.';
                    }
                  }
                  return null;
                },
              );
            },
            controller: firstNameController,
            onChanged: (p0) {
              enableLoginButton();
            },
            enable: !isLoading,
          ),
          DinInput(
            title: 'Apellidos',
            hintText: 'Tus apellidos',
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String names) {
                  final List<String> allNames = names.split(' ');
                  for (var name in allNames) {
                    if (!Util.onlyStringValidator(name)) {
                      return 'Ingrese apellidos validos, sin caracteres especiales.';
                    }
                  }
                  return null;
                },
              );
            },
            controller: lastNameController,
            onChanged: (p0) {
              enableLoginButton();
            },
            enable: !isLoading,
          ),
          DinInput(
            title: 'Correo electronico',
            hintText: 'tu_correo@dominio.com',
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String email) => Util.emailValidator(email)
                    ? null
                    : 'Ingrese un correo valido.',
              );
            },
            controller: emailController,
            onChanged: (p0) {
              enableLoginButton();
            },
            enable: !isLoading,
          ),
          DinInput(
            title: 'Contraseña',
            hintText: 'Crea una contraseña segura',
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
            onChanged: (String? password) {
              validatePassword();
              enableLoginButton();
            },
            controller: passwordController,
            enable: !isLoading,
          ),
          const SizedBox(
            height: DinSize.small,
          ),
          DinInput(
            title: 'Confirma la contraseña',
            hintText: 'Repite la misma contraseña',
            type: DinTextType.password,
            validator: (value) {
              return _generalStringValidation(
                value: value,
                validate: (String confirmPassword) {
                  return passwordController.text.trim() != confirmPassword
                      ? 'Las contraseñas no coinciden.'
                      : null;
                },
              );
            },
            controller: confirmPasswordController,
            onChanged: (p0) {
              enableLoginButton();
            },
            enable: !isLoading,
          ),
          const SizedBox(
            height: DinSize.small,
          ),
          Column(
            children: [
              const Row(
                children: [
                  DinText('La contraseña debe cumplir con:'),
                ],
              ),
              Row(
                children: [
                  showCheckIcon(goodPassSize),
                  DinText(
                    'Al menos ${Util.minPasswprdSize} caracteres alfanumericos.',
                    color: goodPassSize
                        ? DinColors.successColor
                        : DinColors.errorColor,
                  ),
                ],
              ),
              Row(
                children: [
                  showCheckIcon(goodSpecialCharacter),
                  DinText(
                    'Al menos 1 caracter especial.',
                    color: goodSpecialCharacter
                        ? DinColors.successColor
                        : DinColors.errorColor,
                  ),
                ],
              ),
              Row(
                children: [
                  showCheckIcon(goodCapitalLetter),
                  DinText(
                    'Al menos 1 caracter en mayuscula.',
                    color: goodCapitalLetter
                        ? DinColors.successColor
                        : DinColors.errorColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: DinSize.medium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: DinButton(
                        text: 'Crear',
                        onPressed: _signUp,
                        enable: enableBtnCreate,
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
        names: firstNameController.text.trim(),
        lastNames: lastNameController.text.trim(),
        email: emailController.text.trim(),
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
    return validate != null ? validate(value) : null;
  }

  void enableLoginButton() {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      setState(() {
        enableBtnCreate = false;
      });
      return;
    }
    setState(() {
      enableBtnCreate = true;
    });
  }

  void validatePassword() {
    final String password = passwordController.text.trim();
    setState(() {
      goodPassSize = password.length < Util.minPasswprdSize ? false : true;
      goodSpecialCharacter = Util.hasSpecialCharacter(password);
      goodCapitalLetter = Util.hasCapitalLetter(password);
    });
  }

  Icon showCheckIcon(bool isGood) {
    return isGood
        ? const Icon(
            Icons.check,
            size: DinSize.small,
          )
        : const Icon(
            Icons.close,
            size: DinSize.small,
          );
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
