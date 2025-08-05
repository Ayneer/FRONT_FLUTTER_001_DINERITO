import 'package:envied/envied.dart';
import '../../interfaces/env_interface.dart';

part 'dev_env.g.dart';
const String devEnvPath = 'lib/src/configuration/env/dev/.env';

@Envied(path: devEnvPath, obfuscate: true)
class DevEnv implements EnvInterface {
  @EnviedField(varName: 'BASE_API_URL')
  static final String _baseApiUrl = _DevEnv._baseApiUrl;
  @EnviedField(varName: 'LOGIN_API')
  static final String _loginApi = _DevEnv._loginApi;
  @EnviedField(varName: 'REGISTER_API')
  static final String _registerApi = _DevEnv._registerApi;
  
  @override
  String get baseApiUrl => _baseApiUrl;
  @override
  String get loginApi => _loginApi;
  @override
  String get registerApi => _registerApi;
}