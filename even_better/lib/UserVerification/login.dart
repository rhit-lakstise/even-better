import 'package:flutter/material.dart';

import '../main.dart';
import 'Helpers/labeled_text_field.dart';

class Login extends StatefulWidget {
  const Login({
    this.label1 = "Username",
    this.label2 = "Password",
    required this.submitFunction,
    Key? key,
  }) : super(key: key);

  final Function submitFunction;
  final String label1;
  final String label2;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              label: widget.label1,
              textEditingController: usernameController,
              isPassword: false,
              isSignUpPassword: false,
              onSubmit: (String val) {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: LabeledTextField(
                  label: widget.label2,
                  textEditingController: passwordController,
                  isPassword: true,
                  isSignUpPassword: false,
                  onSubmit: (String val) {}),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: () {
                      widget.submitFunction(usernameController.text,
                          passwordController.text, context);
                    },
                    child: const Text("Login"))),
          ],
        ),
      ),
    );
  }
}
