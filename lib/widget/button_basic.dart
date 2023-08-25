import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClickButton;

  const Button({super.key, required this.text, required this.onClickButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onClickButton(), child: Text(text));
  }
}
