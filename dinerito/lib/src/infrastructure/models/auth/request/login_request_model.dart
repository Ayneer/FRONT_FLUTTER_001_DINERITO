class LoginRequestModel {
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> fromObjectToMap() {
    return {
      "email": username,
      "password": password,
    };
  }
}
