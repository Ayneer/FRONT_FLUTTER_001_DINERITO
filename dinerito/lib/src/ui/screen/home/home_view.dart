import 'package:dinerito/src/infrastructure/helpers/din_colors.dart';
import 'package:flutter/material.dart';
import '../../../infrastructure/helpers/session/secure_storage_session.dart';
import '../../router/auth/login_router.dart';
import '../../router/home/dashboard_router.dart';
import 'helpers/widgets/din_app_bar.dart';
import 'helpers/widgets/din_expand_app_bar.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DinColors.secondaryBgColor001,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DinColors.primaryBG002,
        flexibleSpace: DinAppBar(
          logout: _logout,
        ),
      ),
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: DashboardRouter.routeName,
        onGenerateRoute: (RouteSettings settings) {
          Widget page;
          switch (settings.name) {
            case DashboardRouter.routeName:
              page = DashboardRouter.getView();
              break;
            default:
              page = DashboardRouter.getView();
          }
          return MaterialPageRoute(
              builder: (_) => ListView(
                    children: [
                      const DinExpandAppBar(),
                      page,
                    ],
                  ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          final routes = [
            DashboardRouter.routeName,
            '/home/perfil',
            '/home/ajustes',
          ];
          Navigator.of(context).pushNamed(routes[index]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    await SecureStorageSession().cleanToken();
    if (context.mounted) {
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        LoginRouter.routeName,
        (route) => false,
      );
    }
  }
}
