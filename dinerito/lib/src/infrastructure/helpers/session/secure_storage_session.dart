import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageSession {
  final secureStorage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> cleanToken() async {
    await secureStorage.delete(key: 'token');
  }
}
