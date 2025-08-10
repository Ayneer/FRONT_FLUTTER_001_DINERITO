import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/infrastructure/helpers/din_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../infrastructure/helpers/session/secure_storage_session.dart';
import '../../helpers/notifiers/app_notifier.dart';
import '../../router/auth/login_router.dart';
import '../../router/home/create_loan_router.dart';
import '../../router/home/dashboard_router.dart';
import '../../router/home/pay_loan_router.dart';
import 'helpers/notifiers/home_notifier.dart';
import 'helpers/widgets/din_app_bar.dart';
import 'helpers/widgets/din_expand_app_bar.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool expandContent = true;
  bool showBottomNavBar = true;

  @override
  Widget build(BuildContext context) {
    final homeNotifier = context.watch<HomeNotifier>();
    final bool isDarkTheme = context.isDarkTheme;
    final Color backgroundColor =
        isDarkTheme ? DinColors.primaryBgColor004 : DinColors.primaryBG001;

    final String currentRouteName = homeNotifier.routeName;
    final Widget currentView = homeNotifier.view;

    if(currentRouteName == DashboardRouter.routeName){
      expandContent = true;
      showBottomNavBar = true;
    }else{
      showBottomNavBar = false;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DinColors.primaryBgColor003,
        flexibleSpace: DinAppBar(
          logout: _logout,
        ),
      ),
      body: Column(
        children: [
          DinExpandAppBar(
            primaryButtonText: 'Prestar',
            secondaryButtonText: 'Registrar pago',
            expandContent: expandContent,
            onPressedExpandedButton: (bool expanded) {
              setState(() {
                expandContent = !expanded;
              });
            },
            onPressedPrimaryButton: () {
              if (currentRouteName != CreateLoanRouter.routeName) {
                homeNotifier.changeView(CreateLoanRouter.routeName);
                setState(() {
                  expandContent = false;
                });
              }
            },
            onPressedSecondaryButton: () {
              if (currentRouteName != PayLoanRouter.routeName) {
                homeNotifier.changeView(PayLoanRouter.routeName);
                setState(() {
                  expandContent = false;
                });
              }
            },
          ),
          Expanded(
            child: currentView,
          ),
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: showBottomNavBar,
        maintainAnimation: true,
        maintainState: true,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            final routes = [
              DashboardRouter.routeName,
              '/home/perfil',
              '/home/ajustes',
            ];
            homeNotifier.changeView(routes[index]);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Ajustes'),
          ],
        ),
      ),
    );
  }

  Future<void> _logout() async {
    final AppNotifier appNotifier = Provider.of<AppNotifier>(context, listen: false);
    final homeNotifier = Provider.of<HomeNotifier>(context, listen: false);

    await SecureStorageSession().cleanToken();
    appNotifier.cleanLogginData();
    homeNotifier.clearHomeData();
    if (context.mounted) {
      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        LoginRouter.routeName,
        (route) => false,
      );
    }
  }
}
