import '../../../../../domain/use_cases/auth/auth_use_case.dart';
import '../../../../../infrastructure/models/auth/request/login_request_model.dart';
import '../../../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../../../infrastructure/models/error_api_model.dart';
import 'login_interface.dart';

class LoginPresenter {
  const LoginPresenter(
    this._authUseCase,
    this._interface,
  );

  final AuthUseCase _authUseCase;
  final LoginInterface _interface;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await _authUseCase.login(
      LoginRequestModel(
        username: username,
        password: password,
      ),
    );
    response.fold(
      (ErrorApiModel error) {
        _interface.showError(error.detail);
      },
      (LoginResponseModel response) {
        _interface.setSession(response);
      },
    );
  }
}
