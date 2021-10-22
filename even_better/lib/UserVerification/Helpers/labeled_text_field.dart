import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

String listRequirements(password) {
  String errorMessage = "";

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasMinLength = password.length > 8;
  bool hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if (!hasMinLength) {
    errorMessage += "- At least 8 characters\n";
  }
  if (!hasUppercase) {
    errorMessage += "- An uppercase letter\n";
  }
  if (!hasLowercase) {
    errorMessage += "- A lowercase letter\n";
  }
  if (!hasDigits) {
    errorMessage += "- A digit\n";
  }
  if (!hasSpecialCharacters) {
    errorMessage += "- A special character\n";
  }
  //if any of the tests failed, add the prefix to the list
  if (errorMessage != "") {
    errorMessage = "Must contain: \n" + errorMessage;
  }
  return errorMessage;
}

class LabeledTextField extends StatefulWidget {
  LabeledTextField(
      {Key? key,
      required this.label,
      required this.textEditingController,
      required this.isPassword,
      required this.isSignUpPassword,
      required this.onSubmit})
      : super(key: key);
  final TextEditingController textEditingController;
  final String label;
  final bool isPassword;
  final bool isSignUpPassword;
  final onSubmit;
  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.isPassword && widget.isSignUpPassword) {
      widget.textEditingController.addListener(() {
        _listRequirements(widget.textEditingController.text);
        widget.onSubmit("");
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.textEditingController.dispose();
    // this causes an error for some reason... dispose properly to avoid memory leak
  }

  String _listRequirements(password) {
    String requirements = listRequirements(password);

    setState(() {});
    return requirements;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    return ListBody(
      children: [
        Text(widget.label),
        widget.isPassword
            ? PasswordField(
                errorMessage: widget.isSignUpPassword
                    ? _listRequirements(widget.textEditingController.text)
                    : "",
                hintText: "",
                controller: widget.textEditingController,
                onSubmit: widget.onSubmit,
              )
            : TextField(
                obscureText: widget.isPassword,
                controller: widget.textEditingController,
              ),
      ],
    );
  }
}
