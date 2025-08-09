import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_colors.dart';
import '../../infrastructure/helpers/din_typography.dart';

class DinRichText extends StatelessWidget {
  const DinRichText(
    this.text, {
    super.key,
    this.principalStyle,
    this.color,
    this.children,
  });

  final String text;
  final TextStyle? principalStyle;
  final List<InlineSpan>? children;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    Color color_ =
        isDarkTheme ? DinColors.primaryColor002 : DinColors.primaryColor001;

    final TextStyle principalStyle_ =
        principalStyle ?? DinTypography.textLightStyle1;
        
    return RichText(
      text: TextSpan(
        text: text,
        style: principalStyle_.copyWith(
          color: color ?? color_,
        ),
        children: children,
      ),
      selectionColor: Colors.black,
    );
  }
}
