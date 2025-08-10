import 'package:dinerito/src/ui/helpers/widgets/din_text.dart';
import 'package:dinerito/src/ui/router/home/dashboard_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/widgets/din_paginator.dart';
import '../helpers/notifiers/home_notifier.dart';

class CreateLoanView extends StatefulWidget {
  const CreateLoanView({
    super.key,
  });

  @override
  State<CreateLoanView> createState() => _CreateLoanViewState();
}

class _CreateLoanViewState extends State<CreateLoanView> {

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context, listen: false);
    final List<Widget> widgets = <Widget>[
      const DinText('text1'),
      const DinText('text2'),
      const DinText('text3'),
      const DinText('text4'),
    ];

    return DinPaginator(
      steps: widgets,
      onPressedCancel: () {
        homeNotifier.changeView(DashboardRouter.routeName);
      },
    );
  }
}
