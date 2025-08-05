import 'package:flutter/material.dart';

import '../../../../../infrastructure/helpers/din_colors.dart';
import '../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../infrastructure/helpers/din_typography.dart';
import '../../../../widgets/din_button.dart';

class DinAppBar extends StatelessWidget {
  const DinAppBar({
    super.key,
    required this.logout,
  });

  final Future<void> Function() logout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: DinSize.xMedium,
        left: DinSize.xmSmall,
        right: DinSize.xmSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Dinerito',
              style: DinTypography.titleBoldStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: DinSize.xSmall,
            ),
            child: DinButton(
              icon: const Icon(
                Icons.logout,
                color: DinColors.primaryColor001,
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
