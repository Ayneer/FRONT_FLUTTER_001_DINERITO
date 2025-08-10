import 'package:flutter/material.dart';

import '../../../helpers/widgets/din_page_title.dart';

class PayLoanView extends StatefulWidget {
  const PayLoanView({super.key});

  @override
  State<PayLoanView> createState() => _PayLoanViewState();
}

class _PayLoanViewState extends State<PayLoanView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DinPageTitle(
          title: 'Registrar pago',
        ),
      ],
    );
  }
}
