import 'package:dinerito/src/ui/router/auth/login_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/helpers/din_colors.dart';
import '../../../../infrastructure/helpers/din_size.dart';
import '../../../../infrastructure/helpers/din_typography.dart';
import '../../../../infrastructure/helpers/session/secure_storage_session.dart';
import '../../../router/home/home_router.dart';
import '../../../widgets/din_alert.dart';
import '../../../widgets/din_rich_text.dart';
import 'helpers/argument.dart';
import 'helpers/register_interface.dart';
import 'helpers/register_presenter.dart';
import 'helpers/widgets/register_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
    required this.arguments,
  });

  final RegisterArgument arguments;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    implements RegisterInterface {
  late RegisterPresenter _presenter;
  String errorMessage = '';
  bool showAlert = false;

  @override
  void initState() {
    super.initState();
    _presenter = RegisterPresenter(
      widget.arguments.authUseCase,
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DinColors.primaryBG001,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DinSize.small,
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 180,
                  ),
                  child: Text(
                    'Dinerito',
                    style: DinTypography.titleBoldStyle1.copyWith(
                      height: 0.1,
                    ),
                  ),
                ),
                Text(
                  'Gestiona tus préstamos facilmete',
                  style: DinTypography.subTitleMediumStyle1.copyWith(
                    height: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: DinSize.xLarge,
                  ),
                  padding: const EdgeInsets.all(DinSize.paddingSmall),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        DinSize.radiusMedium,
                      ),
                    ),
                    color: DinColors.primaryBG002,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Crea tu cuenta',
                        style: DinTypography.titleSemiBoldStyle1,
                      ),
                      errorMessage.isNotEmpty
                          ? Visibility(
                              visible: showAlert,
                              child: DinAlert(
                                errorMessage,
                                onClose: () => setState(() {
                                  showAlert = false;
                                }),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: DinSize.small,
                      ),
                      RegisterForm(
                        onSignUp: _presenter.register,
                      ),
                      const SizedBox(
                        height: DinSize.large,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DinRichText(
                            '¿Ya tienes una cuenta? ',
                            principalStyle: DinTypography.subTitleMediumStyle1,
                            children: [
                              TextSpan(
                                text: 'Ingresa aquí',
                                style: DinTypography.linkBoldStyle1,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      LoginRouter.routeName,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  setSesionToken(String token) async {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeRouter.routeName, (route) => false);
    await SecureStorageSession().saveToken(token);
  }

  @override
  showError(String message) {
    setState(() {
      errorMessage = message;
      showAlert = true;
    });
  }
}
