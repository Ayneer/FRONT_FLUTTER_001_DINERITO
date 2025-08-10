import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/infrastructure/helpers/enum/din_button_type.dart';
import 'package:flutter/material.dart';

import '../../../../../infrastructure/helpers/din_colors.dart';
import '../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../infrastructure/helpers/din_typography.dart';
import '../../../../helpers/widgets/din_button.dart';
import '../../../../helpers/widgets/din_text.dart';

class DinAppBar extends StatelessWidget {
  const DinAppBar({
    super.key,
    required this.logout,
  });

  final Future<void> Function() logout;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final Color iconColor =
        isDarkTheme ? DinColors.primaryBG001 : DinColors.primaryColor001;
        
    return Padding(
      padding: const EdgeInsets.only(
        top: DinSize.xMedium,
        left: DinSize.xmSmall,
        right: DinSize.xmSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: DinText(
              'Dinerito',
              style: DinTypography.titleBoldStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: DinSize.xSmall,
            ),
            child: DinButton(
              type: DinButtonType.transparent,
              alignment: Alignment.center,
              text: 'Salir',
              icon: Icon(
                Icons.logout,
                color: iconColor,
                size: DinSize.medium,
              ),
              onPressed: () async => await logout(),
            ),
          ),
        ],
      ),
    );
  }
}
