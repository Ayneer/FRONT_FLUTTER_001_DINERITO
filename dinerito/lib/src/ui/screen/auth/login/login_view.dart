import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/ui/router/auth/register_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../infrastructure/helpers/din_colors.dart';
import '../../../../infrastructure/helpers/din_size.dart';
import '../../../../infrastructure/helpers/din_typography.dart';
import '../../../../infrastructure/helpers/session/secure_storage_session.dart';
import '../../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../helpers/notifiers/app_notifier.dart';
import '../../../router/home/home_router.dart';
import '../../../helpers/widgets/din_alert.dart';
import '../../../helpers/widgets/din_rich_text.dart';
import '../../../helpers/widgets/din_text.dart';
import '../../../helpers/widgets/din_text_span.dart';
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
    final AppNotifier appNotifier = context.watch<AppNotifier>();
    final bool isLoading = appNotifier.isLoading;
    final bool isDarkTheme = context.isDarkTheme;
    final Color backgroundColor =
        isDarkTheme ? DinColors.primaryBgColor004 : DinColors.primaryBG001;
    final Color loginFormBackgroundColor =
        isDarkTheme ? DinColors.primaryBgColor003 : DinColors.primaryBG002;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                  child: DinText(
                    'Dinerito',
                    style: DinTypography.titleBoldStyle1.copyWith(
                      height: 0.1,
                    ),
                  ),
                ),
                DinText(
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        DinSize.radiusMedium,
                      ),
                    ),
                    color: loginFormBackgroundColor,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      DinText(
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
                          DinRichText(
                            'Olvidé mi contraseña',
                            isLink: true,
                            enableLink: !isLoading,
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
                              DinTextSpan(
                                'Crear cuenta',
                                isLink: true,
                                enableLink: !isLoading,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RegisterRouter.routeName,
                                  );
                                },
                              ).build(context),
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
  setSession(LoginResponseModel session) async {
    final AppNotifier appNotifier = context.read<AppNotifier>();
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeRouter.routeName,
      (route) => false,
    );
    appNotifier.saveLogginUser(session);
    await SecureStorageSession().saveToken(session.token);
    appNotifier.setIsLoading(false);
  }

  @override
  showError(String message) {
    setState(() {
      errorMessage = message;
      showAlert = true;
    });
  }
}
