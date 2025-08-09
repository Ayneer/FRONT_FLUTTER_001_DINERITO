import 'package:flutter/material.dart';

import '../../../domain/models/user_model.dart';
import '../../../infrastructure/driven_adapters/services/user_preference_service.dart';
import '../../../infrastructure/models/auth/response/login_response_model.dart';

class AppNotifier with ChangeNotifier {
  AppNotifier(
    this._userPreferencesService,
  );
  final UserPreferenceService _userPreferencesService;

  ThemeMode _themeMode = ThemeMode.system;
  LoginResponseModel? _userToken;

  ThemeMode get themeMode => _themeMode;
  LoginResponseModel? get session => _userToken;
  UserEntity? get user => _userToken?.user;

  Future<void> loadUserPreferences() async {
    _themeMode = await _userPreferencesService.getThemeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _userPreferencesService.updateThemeMode(newThemeMode);
  }

  saveLogginUser(LoginResponseModel logginUser) {
    _userToken = logginUser;
    notifyListeners();
  }

  cleanLogginData() {
    _userToken = null;
    notifyListeners();
  }

  cleanAll() async {
    _userToken = null;
    _themeMode = await _userPreferencesService.getThemeMode();
    notifyListeners();
  }
}
