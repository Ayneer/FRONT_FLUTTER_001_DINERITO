import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/ui/widgets/din_text.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_colors.dart';
import '../../infrastructure/helpers/din_size.dart';
import '../../infrastructure/helpers/din_typography.dart';
import '../../infrastructure/helpers/enum/din_button_type.dart';

class DinButton extends StatelessWidget {
  const DinButton({
    super.key,
    this.text = '',
    this.type = DinButtonType.primary,
    this.size = DinSize.xLarge,
    this.width,
    this.enable = true,
    this.icon,
    this.alignment,
    this.textSize,
    required this.onPressed,
  });

  final String text;
  final DinButtonType type;
  final void Function() onPressed;
  final double size;
  final double? width;
  final bool enable;
  final Widget? icon;
  final Alignment? alignment;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final bool onlyIcon = text.isEmpty && icon != null ? true : false;

    return SizedBox(
      height: size,
      width: width,
      child: _getButton(
        onlyIcon,
        isDarkTheme,
      ),
    );
  }

  Widget _getButton(
    bool onlyIcon,
    bool isDarkTheme,
  ) {
    return icon != null
        ? TextButton(
            onPressed: enable ? onPressed : null,
            style: _getButtonStyle(
              onlyIcon,
              isDarkTheme,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: DinSize.xSmall,
                        ),
                        child: DinText(
                          text,
                          style: _getButtonTextStyle(isDarkTheme),
                          color: _getButtonTextStyle(isDarkTheme).color,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        : TextButton(
            onPressed: enable ? onPressed : null,
            style: _getButtonStyle(
              onlyIcon,
              isDarkTheme,
            ),
            child: DinText(
              text,
              style: _getButtonTextStyle(isDarkTheme),
              color: _getButtonTextStyle(isDarkTheme).color,
            ),
          );
  }

  ButtonStyle _getButtonStyle(
    bool onlyIcon,
    bool isDarkTheme,
  ) {
    final Alignment alignment_ =
        onlyIcon ? Alignment.topCenter : (alignment ?? Alignment.center);
    final DinButtonType type_ = onlyIcon ? DinButtonType.transparent : type;

    switch (type_) {
      case DinButtonType.primary:
        return TextButton.styleFrom(
          disabledBackgroundColor: DinColors.disableBgColor,
          alignment: alignment_,
          backgroundColor: isDarkTheme
              ? DinColors.primaryBG002
              : DinColors.primaryBgColor003,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      case DinButtonType.secondary:
        return TextButton.styleFrom(
          alignment: alignment_,
          disabledBackgroundColor: DinColors.disableBgColor,
          padding: onlyIcon ? EdgeInsets.zero : null,
          backgroundColor: isDarkTheme
              ? DinColors.primaryBG002
              : DinColors.secondaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      case DinButtonType.tertiary:
        return TextButton.styleFrom(
          alignment: alignment_,
          disabledBackgroundColor: DinColors.disableBgColor,
          padding: onlyIcon ? EdgeInsets.zero : null,
          backgroundColor: isDarkTheme
              ? DinColors.primaryBgColor003
              : DinColors.primaryBG002,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      case DinButtonType.transparent:
        return TextButton.styleFrom(
          alignment: alignment_,
          padding: onlyIcon ? EdgeInsets.zero : null,
          minimumSize: onlyIcon ? Size.zero : null,
          backgroundColor: DinColors.transparent,
        );

      default:
        return TextButton.styleFrom(
          alignment: alignment,
          backgroundColor: DinColors.primaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
    }
  }

  TextStyle _getButtonTextStyle(
    bool isDarkTheme,
  ) {
    switch (type) {
      case DinButtonType.primary:
        return DinTypography.textBoldStyle1.copyWith(
          color: isDarkTheme
              ? DinColors.primaryColor001
              : DinColors.primaryColor002,
        );

      case DinButtonType.secondary:
        return DinTypography.textBoldStyle1.copyWith(
          color: isDarkTheme
              ? DinColors.secondaryColor001
              : DinColors.primaryColor002,
        );

      case DinButtonType.tertiary:
        return DinTypography.textBoldStyle2;

      case DinButtonType.transparent:
        return DinTypography.textBoldStyle1.copyWith(
          fontSize: textSize ?? DinTypography.sizeMsmall,
        );

      default:
        return DinTypography.textBoldStyle1;
    }
  }
}
