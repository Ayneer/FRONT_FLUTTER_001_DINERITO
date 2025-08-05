import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_typography.dart';

class DinRichText extends StatelessWidget {
  const DinRichText(
    this.text, {
    super.key,
    this.principalStyle,
    this.children,
  });

  final String text;
  final TextStyle? principalStyle;
  final List<InlineSpan>? children;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: principalStyle ?? DinTypography.textLightStyle1,
        children: children,
      ),
      selectionColor: Colors.black,
    );
  }
}
