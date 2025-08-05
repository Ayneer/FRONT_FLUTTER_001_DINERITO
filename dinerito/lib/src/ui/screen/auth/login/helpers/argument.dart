import '../../../../../domain/use_cases/auth/auth_use_case.dart';

class LoginArgument {
  const LoginArgument({
    required this.authUseCase,
  });

  final AuthUseCase authUseCase;
}
