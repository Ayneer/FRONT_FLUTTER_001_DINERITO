class RegisterRequestModel {
  RegisterRequestModel({
    required this.names,
    required this.lastNames,
    required this.email,
    required this.password,
  });

  final String names;
  final String lastNames;
  final String email;
  final String password;

  Map<String, dynamic> fromObjectToMap() {
    return {
      "name": names,
      "lastName": lastNames,
      "email": email,
      "password": password,
    };
  }
}
