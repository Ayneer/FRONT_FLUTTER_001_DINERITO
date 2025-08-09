import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_colors.dart';
import '../../infrastructure/helpers/din_typography.dart';

class DinTextSpan {
  const DinTextSpan(
    this.text, {
    this.style,
    this.onTap,
    this.isLink = false,
    this.enableLink = true,
  });
  final String text;
  final TextStyle? style;
  final void Function()? onTap;
  final bool isLink;
  final bool enableLink;

  InlineSpan build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final TextStyle style_ = style ??
        (isLink ? DinTypography.linkBoldStyle1 : DinTypography.textLightStyle1);
    Color color_ =
        isDarkTheme ? DinColors.primaryColor002 : DinColors.primaryColor001;

    return TextSpan(
      text: text,
      style: style_.copyWith(
        color: color_,
      ),
      recognizer: TapGestureRecognizer()..onTap = enableLink ? onTap : null,
    );
  }
}
