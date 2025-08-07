import '../enum/env_enum.dart';
import '../interfaces/env_interface.dart';
import 'dev/dev_env.dart';
import 'mock/mock_env.dart';
import 'prod/prod_env.dart';

class Env {
  Env();

  static Enviroment env = Enviroment.mock;

  static EnvInterface get getEnv {
    switch (env) {
      case Enviroment.dev:
        return DevEnv();
      case Enviroment.prod:
        return ProdEnv();
      case Enviroment.mock:
        return MockEnv();
      default:
        return DevEnv();
    }
  }
}
