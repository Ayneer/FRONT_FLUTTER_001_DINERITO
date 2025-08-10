import 'package:flutter/material.dart';

import '../../screen/home/loans/pay_loan_view.dart';

class PayLoanRouter {
  static const routeName = '/home/pay-loan';

  static Widget getView() {
    return const PayLoanView();
  }
}