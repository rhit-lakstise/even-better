import 'package:flutter/material.dart';

import 'Helpers/rest_api.dart';
import '../main.dart';
import 'Helpers/labeled_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    required this.roseUsername,
    Key? key,
  }) : super(key: key);

  final String roseUsername;

  // bool checkPasswordAllowed(String password) {
  //   if (password.isEmpty) {
  //     return false;
  //   }
  //   bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  //   bool hasDigits = password.contains(RegExp(r'[0-9]'));
  //   bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  //   bool hasSpecialCharacters =
  //       password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  //   bool hasMinLength = password.length >= 8;

  //   return hasDigits &
  //       hasUppercase &
  //       hasLowercase &
  //       hasSpecialCharacters &
  //       hasMinLength;
  // }

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isValidToSignUp() {
    print("isValidToSignUp()");
    return verifyPasswords() &&
        listRequirements(passwordController.text) == "Must contain: \n";
  }

  bool verifyPasswords() {
    listRequirements(passwordController.text);
    setState(() {});
    return passwordController.text == verifyPasswordController.text;
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            LabeledTextField(
              label: "Username",
              textEditingController: usernameController,
              isPassword: false,
              isSignUpPassword: false,
              onSubmit: (String val) {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: LabeledTextField(
                isPassword: true,
                label: "Password",
                textEditingController: passwordController,
                isSignUpPassword: true,
                onSubmit: (String val) {
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: LabeledTextField(
                label: "Re-enter Password",
                isPassword: true,
                textEditingController: verifyPasswordController,
                isSignUpPassword: true,
                onSubmit: (String val) {
                  setState(() {});
                },
              ),
            ),
            verifyPasswords()
                ? const Text("")
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text("Passwords do not match",
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: isValidToSignUp()
                        ? () {
                            registerEB(usernameController.text,
                                passwordController.text, widget.roseUsername);
                          }
                        : null,
                    child: const Text("Sign Up"))),
          ],
        ),
      ),
    );
  }
}
