import '../enum/env_enum.dart';
import '../interfaces/env_interface.dart';
import 'dev/dev_env.dart';

class Env {
  Env(this.env);

  final Enviroment env;
  EnvInterface getEnv() {
    switch (env) {
      case Enviroment.dev:
        return DevEnv();
      default:
        return DevEnv();
    }
  }
}
