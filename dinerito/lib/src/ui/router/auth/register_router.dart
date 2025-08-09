import 'package:dinerito/src/ui/screen/auth/register/helpers/argument.dart';
import 'package:flutter/material.dart';

import '../../../domain/use_cases/auth/auth_use_case.dart';
import '../../../infrastructure/driven_adapters/api/auth/auth_api.dart';
import '../../screen/auth/register/register_view.dart';

class RegisterRouter {
  static const routeName = '/register';

  static Widget getView(BuildContext context) {
    return RegisterView(
      arguments: RegisterArgument(
        authUseCase: AuthUseCase(
          AuthApi(context),
        ),
      ),
    );
  }
}
