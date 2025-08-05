import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_typography.dart';
import 'din_rich_text.dart';

class DinText extends StatelessWidget {
  const DinText(
    this.text, {
    super.key,
    this.style,
    this.isMoney = false,
  });

  final String text;
  final TextStyle? style;
  final bool isMoney;

  @override
  Widget build(BuildContext context) {
    return isMoney
        ? DinRichText(
            '\$',
            principalStyle: style ?? DinTypography.moneyBoldSmallStyle1,
            children: [
              TextSpan(
                text: text,
                style: DinTypography.moneyBoldMediumStyle1,
              ),
              TextSpan(
                text: ',00',
                style: DinTypography.moneyBoldSmallStyle1,
              ),
            ],
          )
        : Text(
            text,
            style: style ?? DinTypography.textLightStyle1,
          );
  }
}
