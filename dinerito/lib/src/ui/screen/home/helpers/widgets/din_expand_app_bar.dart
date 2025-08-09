import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/models/user_model.dart';
import '../../../../../infrastructure/helpers/din_colors.dart';
import '../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../infrastructure/helpers/din_typography.dart';
import '../../../../../infrastructure/helpers/enum/din_button_type.dart';
import '../../../../helpers/notifiers/app_notifier.dart';
import '../../../../widgets/din_button.dart';
import '../../../../widgets/din_rich_text.dart';
import '../../../../widgets/din_text.dart';
import '../../../../widgets/din_text_span.dart';

class DinExpandAppBar extends StatefulWidget {
  const DinExpandAppBar({super.key});

  @override
  State<DinExpandAppBar> createState() => _DinExpandAppBarState();
}

class _DinExpandAppBarState extends State<DinExpandAppBar> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final Color backgroundColor =
        isDarkTheme ? DinColors.primaryBgColor003 : DinColors.primaryBG002;
    final AppNotifier appNotifier = context.read<AppNotifier>();
    final UserEntity? user = appNotifier.user;
    final String userName = user?.name ?? '';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DinSize.xmSmall,
        vertical: DinSize.xSmall,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: DinColors.tertiaryColorOpacity,
            offset: const Offset(0.0, 1.0),
            blurRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(DinSize.radiusMedium),
          bottomRight: Radius.circular(DinSize.radiusMedium),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DinRichText(
                      'Hola, ',
                      children: [
                        DinTextSpan(
                          userName,
                          style: DinTypography.textBoldStyle2,
                        ).build(context)
                      ],
                    ),
                    const DinText('Aqui tienes un resumen de tu dinerito.'),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DinText('Has prestado:'),
                    DinText(
                      "20.000.000",
                      isMoney: true,
                    ),
                    DinText('Mira tus ganancias:'),
                    DinText(
                      "20.000.000",
                      isMoney: true,
                    ),
                    DinText('Por recibir:'),
                    DinText(
                      "20.000.000",
                      isMoney: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DinButton(
                  onPressed: () {},
                  text: 'Prestar',
                  width: 150,
                ),
                const SizedBox(
                  width: 50,
                ),
                DinButton(
                  type: DinButtonType.secondary,
                  onPressed: () {},
                  text: 'Registrar pago',
                  width: 150,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
