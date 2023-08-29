import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool isDisabled;
  final String text;
  final Function onClickButton;

  const Button(
      {super.key,
      required this.text,
      required this.onClickButton,
      required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 15))),
          onPressed: () {},
          child: Text(text));
    } else {
      return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 15))),
          onPressed: () => onClickButton(),
          child: Text(text));
    }
  }
}
