import 'package:flutter/material.dart';

import '../../screen/home/loans/create_loan_view.dart';

class CreateLoanRouter {
  static const routeName = '/home/create-loan';

  static Widget getView() {
    return const CreateLoanView();
  }
}