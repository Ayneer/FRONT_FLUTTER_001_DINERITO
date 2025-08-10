import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/helpers/din_colors.dart';
import '../../../infrastructure/helpers/din_typography.dart';
import 'din_rich_text.dart';
import 'din_text_span.dart';

class DinText extends StatelessWidget {
  const DinText(
    this.text, {
    super.key,
    this.style,
    this.isMoney = false,
    this.color,
  });

  final String text;
  final TextStyle? style;
  final bool isMoney;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    Color color_ =
        isDarkTheme ? DinColors.primaryColor002 : DinColors.primaryColor001;
    TextStyle style_ = style ?? DinTypography.textLightStyle1;

    return isMoney
        ? DinRichText(
            '\$',
            principalStyle: style ?? DinTypography.moneyBoldSmallStyle1,
            children: [
              DinTextSpan(
                text,
                style: DinTypography.moneyBoldMediumStyle1,
              ).build(context),
              DinTextSpan(
                ',00',
                style: DinTypography.moneyBoldSmallStyle1,
              ).build(context),
            ],
          )
        : Text(
            text,
            style: style_.copyWith(
              color: color ?? color_,
            ),
          );
  }
}
