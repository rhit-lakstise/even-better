// ignore: file_names
import 'package:flutter/material.dart';
import 'register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true; // true: sign in, false: sign out
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // if (showSignIn) {
    // return SignIn(toggleView: toggleView);
    // } else {
    return Register(toggleView: toggleView);
    // }
    // return Container(
    //   child: Register(),
    // );
  }
}