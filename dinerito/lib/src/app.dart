import 'package:dinerito/src/ui/router/auth/login_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'infrastructure/helpers/session/secure_storage_session.dart';
import 'ui/helpers/notifiers/app_notifier.dart';
import 'ui/router/auth/register_router.dart';
import 'ui/router/home/home_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    const Locale locale = Locale('es', 'CO');
    Future<bool> isLoggedIn() async {
      final token = await SecureStorageSession().getToken();
      return token != null;
    }
    final AppNotifier appNotifier = context.watch<AppNotifier>();

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
      darkTheme: ThemeData.dark(),
      themeMode: appNotifier.themeMode,
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
  }
}
