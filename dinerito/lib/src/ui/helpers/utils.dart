import 'package:email_validator/email_validator.dart';

class Util {
  static const int minPasswprdSize = 8;
  static bool emailValidator(String email) => EmailValidator.validate(email);
  static bool onlyStringValidator(String text) =>
      RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  static bool hasSpecialCharacter(String text) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(text);
  static bool hasCapitalLetter(String text) =>
      RegExp(r'^(?=.*[A-Z]).+$').hasMatch(text);
}
