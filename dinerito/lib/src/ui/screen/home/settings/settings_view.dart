import 'package:flutter/material.dart';
import '../../../helpers/notifiers/app_notifier.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.appNotifier,
  });

  static const routeName = '/settings';

  final AppNotifier appNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: appNotifier.themeMode,
          onChanged: appNotifier.updateThemeMode,
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
