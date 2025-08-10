import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/infrastructure/helpers/din_colors.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/helpers/din_typography.dart';
import 'din_button.dart';
import 'din_text.dart';

class DinPageTitle extends StatelessWidget {
  const DinPageTitle({
    super.key,
    required this.title,
    this.titleStyle,
    this.leftIcon = const Icon(
      Icons.arrow_back_ios_new_rounded,
    ),
    this.rightIcon = const Icon(
      Icons.arrow_forward_ios_rounded,
    ),
    this.leftText,
    this.rightText,
    this.onPressedLeftIcon,
    this.onPressedRightIcon,
    this.iconSize,
  });

  final String title;
  final TextStyle? titleStyle;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final String? leftText;
  final String? rightText;
  final double? iconSize;
  final void Function()? onPressedLeftIcon;
  final void Function()? onPressedRightIcon;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final bool showLeftIcon = leftIcon != null ? true : false;
    final bool showRighticon = rightIcon != null ? true : false;
    final Color iconColor = isDarkTheme ? DinColors.primaryBG002 : DinColors.primaryBgColor003;

    return Row(
      children: [
        Visibility(
          visible: showLeftIcon,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: DinButton(
            text: leftText ?? '',
            icon: Icon(
              leftIcon?.icon ?? Icons.arrow_back_ios_new_rounded,
              color: iconColor,
              size: iconSize,
            ),
            onPressed: onPressedLeftIcon ?? () {
              Navigator.of(context).pop();
            },
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 0),
          ),
        ),
        Expanded(
          child: Center(
            child: DinText(
              title,
              style: titleStyle ?? DinTypography.titleMediumStyle1,
            ),
          ),
        ),
        Visibility(
          visible: showRighticon,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: DinButton(
            text: rightText ?? '',
            icon: Icon(
              rightIcon?.icon ?? Icons.arrow_forward_ios_rounded,
              color: iconColor,
              size: iconSize,
            ),
            onPressed: onPressedRightIcon ?? () {},
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 0),
          ),
        ),
      ],
    );
  }
}
