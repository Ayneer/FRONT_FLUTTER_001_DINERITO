import 'package:flutter/material.dart';
import '../../infraestructure/helpers/din_colors.dart';
import '../../infraestructure/helpers/din_size.dart';
import '../../infraestructure/helpers/din_typography.dart';
import '../../infraestructure/helpers/enum/din_text_type.dart';
import '../../sample_feature/sample_item.dart';
import '../widgets/din_button.dart';
import '../widgets/din_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

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
                  margin: const EdgeInsets.only(
                    top: DinSize.xLarge,
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
                      const SizedBox(
                        height: DinSize.small,
                      ),
                      const DinInput(
                        title: 'Usuario',
                        hintText: 'mi_usuario',
                      ),
                      const SizedBox(
                        height: DinSize.small,
                      ),
                      const DinInput(
                        title: 'Contraseña',
                        hintText: '*******',
                        type: DinTextType.password,
                      ),
                      const SizedBox(
                        height: DinSize.medium,
                      ),
                      DinButton(
                        text: 'Ingresar',
                        onPressed: () {},
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
                          RichText(
                              text: TextSpan(
                                text: '¿Aún no tienes una cuenta? ',
                                style: DinTypography.subTitleMediumStyle1,
                                children: [
                                  TextSpan(
                                    text: 'Crear cuenta',
                                    style: DinTypography.linkBoldStyle1,
                                  ),
                                ],
                              ),
                              selectionColor: Colors.black)
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
}
