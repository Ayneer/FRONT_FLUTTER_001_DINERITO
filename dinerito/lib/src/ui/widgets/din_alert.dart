import 'package:dinerito/src/infrastructure/helpers/din_colors.dart';
import 'package:dinerito/src/infrastructure/helpers/din_size.dart';
import 'package:dinerito/src/ui/widgets/din_button.dart';
import 'package:dinerito/src/ui/widgets/din_text.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/helpers/din_typography.dart';

class DinAlert extends StatefulWidget {
  const DinAlert(
    this.bodyText, {
    super.key,
    required this.onClose,
  });

  final String bodyText;
  final void Function() onClose;

  @override
  State<DinAlert> createState() => _DinAlertState();
}

class _DinAlertState extends State<DinAlert> {
  bool showAlert = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: DinSize.paddingSmall,
      ),
      padding: const EdgeInsets.only(
        left: DinSize.xSmall,
        bottom: DinSize.xSmall,
        top: DinSize.xSmall,
      ),
      color: DinColors.errorColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DinText(
              widget.bodyText,
              style: DinTypography.textLightMsmallStyle1,
            ),
          ),
          DinButton(
            onPressed: () => widget.onClose(),
            icon: const Icon(
              Icons.close,
              size: DinSize.small,
              color: DinColors.primaryColor001,
            ),
          ),
        ],
      ),
    );
  }
}
