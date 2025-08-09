import 'package:flutter/material.dart';

import '../../../domain/use_cases/auth/auth_use_case.dart';
import '../../../infrastructure/driven_adapters/api/auth/auth_api.dart';
import '../../screen/auth/login/helpers/argument.dart';
import '../../screen/auth/login/login_view.dart';

class LoginRouter {
  static const routeName = '/login';

  static Widget getView(BuildContext context) {
    return LoginView(
      arguments: LoginArgument(
        authUseCase: AuthUseCase(
          AuthApi(context),
        ),
      ),
    );
  }
}
