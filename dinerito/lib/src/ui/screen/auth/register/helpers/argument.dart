import '../../../../../domain/use_cases/auth/auth_use_case.dart';

class RegisterArgument {
  const RegisterArgument({
    required this.authUseCase,
  });

  final AuthUseCase authUseCase;
}
