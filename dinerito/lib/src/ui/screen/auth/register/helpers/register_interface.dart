import '../../../../../infrastructure/models/auth/response/login_response_model.dart';

abstract interface class RegisterInterface {
  setSession(LoginResponseModel session);
  showError(String message);
}