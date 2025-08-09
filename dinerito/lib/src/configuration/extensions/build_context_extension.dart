import 'package:flutter/material.dart';

extension DinBuildContext on BuildContext {
  bool get isDarkTheme {
    ThemeData theme = Theme.of(this);
    return theme.brightness == Brightness.dark;
  }
}
