import 'package:dinerito/src/ui/router/auth/register_router.dart';
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
import 'helpers/login_interface.dart';
import 'helpers/login_presenter.dart';
import 'helpers/widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
    required this.arguments,
  });

  final LoginArgument arguments;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements LoginInterface {
  late LoginPresenter _presenter;
  String errorMessage = '';
  bool showAlert = false;

  @override
  void initState() {
    super.initState();
    _presenter = LoginPresenter(
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
                        'Accede a tu cuenta',
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
                      LoginForm(
                        onLogin: ({
                          required String username,
                          required String password,
                        }) async {
                          await _presenter.login(
                            username: username,
                            password: password,
                          );
                        },
                      ),
                      const SizedBox(
                        height: DinSize.large,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Olvidé mi contraseña',
                            style: DinTypography.linkBoldStyle1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: DinSize.xSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DinRichText(
                            '¿Aún no tienes una cuenta? ',
                            principalStyle: DinTypography.subTitleMediumStyle1,
                            children: [
                              TextSpan(
                                  text: 'Crear cuenta',
                                  style: DinTypography.linkBoldStyle1,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                        context,
                                        RegisterRouter.routeName,
                                      );
                                    }),
                            ],
                          ),
                          // RichText(
                          //   text: TextSpan(
                          //     text: '¿Aún no tienes una cuenta? ',
                          //     style: DinTypography.subTitleMediumStyle1,
                          //     children: [
                          //       TextSpan(
                          //         text: 'Crear cuenta',
                          //         style: DinTypography.linkBoldStyle1,
                          //       ),
                          //     ],
                          //   ),
                          //   selectionColor: Colors.black,
                          // )
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
    print(token);
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
