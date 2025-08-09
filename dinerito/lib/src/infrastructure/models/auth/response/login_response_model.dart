import '../../../../domain/models/user_model.dart';
import '../../../../configuration/interfaces/din_model_interface.dart';

class LoginResponseModel implements DinModelInterface<LoginResponseModel> {
  LoginResponseModel({
    required this.token,
    required this.user,
  });

  final String token;
  final UserEntity user;

  @override
  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'] as String,
      user: UserEntity.fromMap(map['user']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "token": token,
      "user": user.toMap(),
    };
  }
}
