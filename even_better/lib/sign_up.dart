import 'package:flutter/material.dart';

import './main.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _login() {
    if (verifyPasswordController.text == passwordController.text) {
      //TODO: Verify credentials with firebase here
      print(usernameController.text);
      print(passwordController.text);
      print(verifyPasswordController.text);
    } else {
      //TODO: tell the user the password does not match

    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: LabeledTextField(
                label: "Password",
                textEditingController: passwordController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: LabeledTextField(
                label: "Re-enter Password",
                textEditingController: verifyPasswordController,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: _login, child: const Text("Sign Up"))),
          ],
        ),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  const LabeledTextField(
      {Key? key, required this.label, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Text(label),
        TextField(
          controller: textEditingController,
        ),
      ],
    );
  }
}
