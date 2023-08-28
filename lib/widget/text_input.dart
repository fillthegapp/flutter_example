import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text;
  final bool secret;
  final bool autocorrect;
  final int maxLength;
  final Icon icon;
  final TextInputType inputType;
  final Function(String?) validateText;
  final Function onChangeText;

  const TextInput(
      {super.key,
      required this.text,
      required this.icon,
      required this.validateText,
      required this.onChangeText,
      required this.secret,
      required this.inputType,
      required this.autocorrect,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength == 0 ? TextField.noMaxLength : maxLength,
      obscureText: secret,
      autocorrect: autocorrect,
      keyboardType: inputType,
      decoration: InputDecoration(
        icon: icon,
        hintText: text,
      ),
      validator: (value) => validateText(value),
      onChanged: (value) => onChangeText(value),
    );
  }
}
