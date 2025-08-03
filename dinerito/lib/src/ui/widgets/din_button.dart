import 'package:flutter/material.dart';

import '../../infraestructure/helpers/din_colors.dart';
import '../../infraestructure/helpers/din_size.dart';
import '../../infraestructure/helpers/din_typography.dart';
import '../../infraestructure/helpers/enum/din_button_type.dart';

class DinButton extends StatelessWidget {
  const DinButton({
    super.key,
    this.text = '',
    this.type = DinButtonType.primary,
    this.size = DinSize.xLarge,
    required this.onPressed,
  });

  final String text;
  final DinButtonType type;
  final void Function() onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: size,
            child: TextButton(
              onPressed: onPressed,
              style: _getButtonStyle(),
              child: Text(
                text,
                style: DinTypography.textBoldStyle1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (type) {
      case DinButtonType.primary:
        return TextButton.styleFrom(
          backgroundColor: DinColors.primaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );

      default:
        return TextButton.styleFrom(
          backgroundColor: DinColors.primaryColor001,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
    }
  }
}
