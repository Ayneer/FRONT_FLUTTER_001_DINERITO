import 'package:flutter/material.dart';

import '../../screen/home/dashboard/dashboard_view.dart';

class DashboardRouter {
  static const routeName = '/home/dashboard';

  static Widget getView() {
    return const DashboardView();
  }
}