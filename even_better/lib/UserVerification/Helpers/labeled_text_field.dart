import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField(
      {Key? key,
      required this.label,
      required this.textEditingController,
      required this.obscureText})
      : super(key: key);
  final TextEditingController textEditingController;
  final String label;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Text(label),
        TextField(
          obscureText: obscureText,
          controller: textEditingController,
        ),
      ],
    );
  }
}
