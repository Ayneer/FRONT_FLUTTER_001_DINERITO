class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.user,
  });

  final String token;
  final Map<String, dynamic> user;

  static LoginResponseModel fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'] as String,
      user: map['user'] as Map<String, dynamic>,
    );
  }

  static Map<String, dynamic> toMap(LoginResponseModel object) {
    return <String, dynamic>{
      "token": object.token,
      "user": object.user,
    };
  }
}
