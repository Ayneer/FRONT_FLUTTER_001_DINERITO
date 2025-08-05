import 'package:flutter/material.dart';

import '../../screen/home/home_view.dart';

class HomeRouter {
  static const routeName = '/home';

  static Widget getView() {
    return const HomeWidget();
  }
}