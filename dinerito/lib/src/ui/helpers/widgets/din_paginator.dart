import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/helpers/din_colors.dart';
import '../../../infrastructure/helpers/din_size.dart';
import '../../../infrastructure/helpers/enum/din_button_type.dart';
import 'din_button.dart';
import 'din_page_title.dart';
import 'din_text.dart';

class DinPaginator extends StatefulWidget {
  const DinPaginator({
    super.key,
    required this.steps,
    required this.onPressedCancel,
  });

  final List<Widget> steps;
  final void Function() onPressedCancel;

  @override
  State<DinPaginator> createState() => _DinPaginatorState();
}

class _DinPaginatorState extends State<DinPaginator> {
  int currentStep = 1;
  bool enableNextStep = true;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.isDarkTheme;
    final Color backgroundColor =
        isDarkTheme ? DinColors.primaryBgColor004 : DinColors.primaryBG001;
    final Color footerBackgroundColor =
        isDarkTheme ? DinColors.primaryBgColor003 : DinColors.primaryBG001;
    final bool isFirstStep = currentStep == 1;
    final List<Widget> widgets = widget.steps;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DinSize.xmSmall,
            ),
            child: DinPageTitle(
              title: 'Registrar prestamo',
              leftIcon: isFirstStep
                  ? null
                  : const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
              iconSize: DinSize.small,
              onPressedLeftIcon: () {
                _backStep();
              },
              onPressedRightIcon: () {
                _nextStep();
              },
            ),
          ),
          const SizedBox(
            height: DinSize.paddingXsmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DinSize.xmSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DinText(
                  'Paso $currentStep de ${widgets.length}',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: DinSize.paddingXsmall,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DinSize.xmSmall,
              ),
              child: widgets[currentStep - 1],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: DinSize.paddingMedium,
            ),
            decoration: BoxDecoration(
              color: footerBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DinSize.radiusMedium),
                topRight: Radius.circular(DinSize.radiusMedium),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DinButton(
                  text: 'Cancelar',
                  onPressed: widget.onPressedCancel,
                  width: DinSize.btnLarge,
                  type: DinButtonType.danger,
                ),
                const SizedBox(
                  width: DinSize.large,
                ),
                DinButton(
                  text: 'Continuar',
                  onPressed: () {
                    _nextStep();
                  },
                  width: DinSize.btnLarge,
                  enable: enableNextStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _nextStep({int? step}) {
    final int nextStep = step ?? currentStep + 1;
    if (nextStep <= 4) {
      setState(() {
        currentStep = nextStep;
        enableNextStep = nextStep == 4 ? false : true;
      });
    }
  }

  void _backStep({int? step}) {
    final int backStep = step ?? currentStep - 1;
    if (backStep >= 1) {
      setState(() {
        currentStep = backStep;
        enableNextStep = backStep == 4 ? false : true;
      });
    }
  }
}
