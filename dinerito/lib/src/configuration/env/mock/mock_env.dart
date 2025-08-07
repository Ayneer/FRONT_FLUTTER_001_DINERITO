import 'package:envied/envied.dart';
import '../../interfaces/env_interface.dart';

part 'mock_env.g.dart';
const String envPath = 'lib/src/configuration/env/mock/.env';

@Envied(path: envPath, obfuscate: true)
class MockEnv implements EnvInterface {
  @EnviedField(varName: 'BASE_API_URL')
  static final String _baseApiUrl = _MockEnv._baseApiUrl;
  @EnviedField(varName: 'LOGIN_API')
  static final String _loginApi = _MockEnv._loginApi;
  @EnviedField(varName: 'REGISTER_API')
  static final String _registerApi = _MockEnv._registerApi;
  
  @override
  String get baseApiUrl => _baseApiUrl;
  @override
  String get loginApi => _loginApi;
  @override
  String get registerApi => _registerApi;
}