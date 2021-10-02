import 'package:flutter/material.dart';

import './firsttime.dart';
import './login.dart';
import 'sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const appTitle = "Even Better";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: MyApp.appTitle,
        theme: ThemeData(
          //TODO: make a custom color with the rose color palette
          primarySwatch: Colors.red,
        ),
        home: const SignUp());
  }
}
