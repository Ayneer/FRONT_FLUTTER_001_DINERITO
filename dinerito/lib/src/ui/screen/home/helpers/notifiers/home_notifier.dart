import 'package:flutter/material.dart';

import '../../../../router/home/create_loan_router.dart';
import '../../../../router/home/dashboard_router.dart';
import '../../../../router/home/pay_loan_router.dart';

class HomeNotifier extends ChangeNotifier {
  String _routeName = DashboardRouter.routeName;
  Widget _view = DashboardRouter.getView();

  String get routeName => _routeName;
  Widget get view => _view;

  void changeView(String routeName) {
    Widget view;
    String route = routeName;
    switch (routeName) {
      case DashboardRouter.routeName:
        view = DashboardRouter.getView();
        break;
      case CreateLoanRouter.routeName:
        view = CreateLoanRouter.getView();
        break;
      case PayLoanRouter.routeName:
        view = PayLoanRouter.getView();
        break;
      default:
        view = DashboardRouter.getView();
        route = DashboardRouter.routeName;
    }
    _routeName = route;
    _view = view;
    notifyListeners();
  }

  void clearHomeData(){
    _routeName = DashboardRouter.routeName;
    _view = DashboardRouter.getView();
  }
}
