import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/infrastructure/helpers/din_colors.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_typography.dart';
import '../../infrastructure/helpers/enum/din_text_type.dart';

class DinInput extends StatelessWidget {
  const DinInput({
    super.key,
    required this.title,
    this.hintText,
    this.type = DinTextType.text,
    this.validator,
    this.onChanged,
    this.controller,
    this.labelStyle,
    this.labelColor,
  });

  final String? hintText;
  final String? title;
  final DinTextType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    Color labelColor_ =
        isDarkTheme ? DinColors.primaryColor002 : DinColors.primaryColor001;
    TextStyle labelStyle_ = labelStyle ??
        DinTypography.textLightStyle1;

    return TextFormField(
      obscureText: type == DinTextType.text ? false : true,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: title,
        labelStyle: labelStyle_.copyWith(
          color: labelColor ?? labelColor_,
        ),
      ),
      validator: validator,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
