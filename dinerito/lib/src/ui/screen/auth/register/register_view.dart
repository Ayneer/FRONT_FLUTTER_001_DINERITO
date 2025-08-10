import 'package:dinerito/src/configuration/extensions/build_context_extension.dart';
import 'package:dinerito/src/ui/router/auth/login_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../infrastructure/helpers/din_colors.dart';
import '../../../../infrastructure/helpers/din_size.dart';
import '../../../../infrastructure/helpers/din_typography.dart';
import '../../../../infrastructure/helpers/session/secure_storage_session.dart';
import '../../../../infrastructure/models/auth/response/login_response_model.dart';
import '../../../helpers/notifiers/app_notifier.dart';
import '../../../helpers/widgets/din_page_title.dart';
import '../../../router/home/home_router.dart';
import '../../../helpers/widgets/din_alert.dart';
import '../../../helpers/widgets/din_rich_text.dart';
import '../../../helpers/widgets/din_text.dart';
import '../../../helpers/widgets/din_text_span.dart';
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
    final AppNotifier appNotifier = context.watch<AppNotifier>();
    final bool isLoading = appNotifier.isLoading;
    final bool isDarkTheme = context.isDarkTheme;
    final Color backgroundColor =
        isDarkTheme ? DinColors.primaryBgColor004 : DinColors.primaryBG001;
    final Color registerFormBackgroundColor =
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
                    color: registerFormBackgroundColor,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      DinPageTitle(
                        title: 'Crea tu cuenta',
                        rightIcon: null,
                        onPressedLeftIcon: () {
                          Navigator.pop(context);
                        },
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
                              DinTextSpan(
                                'Ingresa aquí',
                                isLink: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    LoginRouter.routeName,
                                  );
                                },
                                enableLink: !isLoading,
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
        context, HomeRouter.routeName, (route) => false);
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
