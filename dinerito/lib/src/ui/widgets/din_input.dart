import 'package:flutter/material.dart';

import '../../infraestructure/helpers/enum/din_text_type.dart';

class DinInput extends StatelessWidget {
  const DinInput({
    super.key,
    this.hintText,
    this.type = DinTextType.text,
    required this.title,
  });

  final String? hintText;
  final String? title;
  final DinTextType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: type == DinTextType.text ? false : true,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: title,
      ),
    );
  }
}
