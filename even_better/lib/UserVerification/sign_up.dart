import 'package:flutter/material.dart';

import '../main.dart';
import 'Helpers/labeled_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _registerEB() {
    if (verifyPasswordController.text == passwordController.text) {
      //TODO: add new credentials to firebase
      var username = usernameController.text;
      var password = passwordController.text;
      print("registration time!");
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
              obscureText: false,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: LabeledTextField(
                obscureText: true,
                label: "Password",
                textEditingController: passwordController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: LabeledTextField(
                label: "Re-enter Password",
                obscureText: true,
                textEditingController: verifyPasswordController,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: _registerEB, child: const Text("Sign Up"))),
          ],
        ),
      ),
    );
  }
}
