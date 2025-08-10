import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/models/user_model.dart';
import '../../../../../infrastructure/helpers/din_colors.dart';
import '../../../../../infrastructure/helpers/din_size.dart';
import '../../../../../infrastructure/helpers/din_typography.dart';
import '../../../../../infrastructure/helpers/enum/din_button_type.dart';
import '../../../../helpers/notifiers/app_notifier.dart';
import '../../../../helpers/widgets/din_button.dart';
import '../../../../helpers/widgets/din_rich_text.dart';
import '../../../../helpers/widgets/din_text.dart';
import '../../../../helpers/widgets/din_text_span.dart';

class DinExpandAppBar extends StatefulWidget {
  const DinExpandAppBar({
    super.key,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onPressedExpandedButton,
    this.onPressedPrimaryButton,
    this.onPressedSecondaryButton,
    this.expandContent = true,
  });

  final String primaryButtonText;
  final String secondaryButtonText;
  final void Function()? onPressedPrimaryButton;
  final void Function()? onPressedSecondaryButton;
  final bool expandContent;
  final void Function(bool) onPressedExpandedButton;

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
      child: AnimatedSize(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
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
                      Visibility(
                        visible: widget.expandContent,
                        child: const DinText(
                            'Aqui tienes un resumen de tu dinerito.'),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.expandContent,
                  child: const Expanded(
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
                ),
              ],
            ),
            Visibility(
              visible: widget.expandContent,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DinButton(
                      onPressed: widget.onPressedPrimaryButton ?? () {},
                      text: widget.primaryButtonText,
                      width: 150,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    DinButton(
                      type: DinButtonType.secondary,
                      onPressed: widget.onPressedSecondaryButton ?? () {},
                      text: widget.secondaryButtonText,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
            DinButton(
              onPressed: () {
                widget.onPressedExpandedButton(widget.expandContent);
                // setState(() {
                //   expandContent = !expandContent;
                // });
              },
              icon: Icon(
                widget.expandContent
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                  size: DinSize.large,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
