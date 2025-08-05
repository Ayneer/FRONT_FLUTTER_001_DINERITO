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

  @override
  Widget build(BuildContext context) {
    final bool onlyIcon = text.isEmpty && icon != null ? true : false;

    return SizedBox(
      height: size,
      width: width,
      child: _getButton(
        onlyIcon,
      ),
    );
  }

  Widget _getButton(bool onlyIcon) {
    return icon != null
        ? TextButton(
            onPressed: onPressed,
            style: _getButtonStyle(onlyIcon),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon!,
                text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: DinSize.xSmall,
                        ),
                        child: Text(
                          text,
                          style: _getButtonTextStyle(),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        : TextButton(
            onPressed: onPressed,
            style: _getButtonStyle(onlyIcon),
            child: Text(
              text,
              style: _getButtonTextStyle(),
            ),
          );
  }

  ButtonStyle _getButtonStyle(bool onlyIcon) {
    final Alignment alignment_ =
        onlyIcon ? Alignment.topCenter : Alignment.center;
    final DinButtonType type_ = onlyIcon ? DinButtonType.transparent : type;

    switch (type_) {
      case DinButtonType.primary:
        return TextButton.styleFrom(
          alignment: alignment_,
          backgroundColor: DinColors.primaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      case DinButtonType.secondary:
        return TextButton.styleFrom(
          alignment: alignment_,
          padding: onlyIcon ? EdgeInsets.zero : null,
          backgroundColor: DinColors.secondaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      case DinButtonType.tertiary:
        return TextButton.styleFrom(
          alignment: alignment_,
          padding: onlyIcon ? EdgeInsets.zero : null,
          backgroundColor: DinColors.primaryColor002,
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

  TextStyle _getButtonTextStyle() {
    switch (type) {
      case DinButtonType.primary:
        return DinTypography.textBoldStyle1;

      case DinButtonType.tertiary:
        return DinTypography.textBoldStyle2;

      default:
        return DinTypography.textBoldStyle1;
    }
  }
}
