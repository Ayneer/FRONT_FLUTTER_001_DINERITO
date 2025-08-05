import 'package:dinerito/src/ui/router/auth/login_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'infrastructure/helpers/session/secure_storage_session.dart';
import 'ui/screen/home/settings/settings_controller.dart';
import 'ui/router/auth/register_router.dart';
import 'ui/router/home/home_router.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    const Locale locale = Locale('es', 'CO');
    Future<bool> isLoggedIn() async {
      final token = await SecureStorageSession().getToken();
      print('token');
      print(token);
      return token != null;
    }

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          scrollBehavior:
              const MaterialScrollBehavior().copyWith(overscroll: false),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,
          supportedLocales: const <Locale>[locale],
          title: 'any',
          theme: ThemeData(),
          // darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) => FutureBuilder<bool>(
                future: isLoggedIn(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final bool loggedIn = snapshot.data!;
                  final String? route = routeSettings.name;

                  if (loggedIn) {
                    return  HomeRouter.getView();
                  }

                  switch (route) {
                    case LoginRouter.routeName:
                      return LoginRouter.getView();
                    case RegisterRouter.routeName:
                      return RegisterRouter.getView();
                    case HomeRouter.routeName:
                      return HomeRouter.getView();
                    default:
                      return LoginRouter.getView();
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
