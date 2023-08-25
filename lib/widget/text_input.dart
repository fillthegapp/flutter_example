import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text;
  final bool secret;
  final Icon icon;
  final Function validateText;
  final Function onChangeText;

  const TextInput(
      {super.key,
      required this.text,
      required this.icon,
      required this.validateText,
      required this.onChangeText,
      required this.secret});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secret,
      decoration: InputDecoration(
        icon: icon,
        hintText: text,
      ),
      validator: (value) => validateText(value),
      onChanged: (value) => onChangeText(value),
    );
  }
}
