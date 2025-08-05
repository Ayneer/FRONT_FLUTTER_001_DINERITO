import '../../../../../domain/use_cases/auth/auth_use_case.dart';
import '../../../../../infrastructure/models/auth/request/register_request_model.dart';
import '../../../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../../../infrastructure/models/error_api_model.dart';
import 'register_interface.dart';

class RegisterPresenter {
  const RegisterPresenter(
    this._authUseCase,
    this._interface,
  );

  final AuthUseCase _authUseCase;
  final RegisterInterface _interface;

  Future<void> register({
    required String names,
    required String lastNames,
    required String email,
    required String password,
  }) async {
    final response = await _authUseCase.register(
      RegisterRequestModel(
        names: names,
        lastNames: lastNames,
        email: email,
        password: password,
      ),
    );

    response.fold(
      (ErrorApiModel error) {
        _interface.showError(error.message);
      },
      (LoginResponseModel response) {
        _interface.setSesionToken(response.token);
      },
    );
  }
}
