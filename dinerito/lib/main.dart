import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/infrastructure/driven_adapters/services/user_preference_service.dart';
import 'src/ui/helpers/notifiers/app_notifier.dart';
import 'src/ui/screen/home/helpers/notifiers/home_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appNotifier = AppNotifier(UserPreferenceService());
  await appNotifier.loadUserPreferences();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: appNotifier,
        ),
        ChangeNotifierProvider(create: (_) => HomeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}
