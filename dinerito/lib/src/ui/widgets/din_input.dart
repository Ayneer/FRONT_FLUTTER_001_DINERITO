import 'package:flutter/material.dart';

import '../../infrastructure/helpers/enum/din_text_type.dart';

class DinInput extends StatelessWidget {
  const DinInput({
    super.key,
    required this.title,
    this.hintText,
    this.type = DinTextType.text,
    this.validator,
    this.onChanged,
    this.controller,
  });

  final String? hintText;
  final String? title;
  final DinTextType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: type == DinTextType.text ? false : true,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: title,
      ),
      validator: validator,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
