import 'package:flutter/material.dart';

import './main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  void _login() {}

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _login, child: const Text("Login")),
            ElevatedButton(onPressed: _login, child: const Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
