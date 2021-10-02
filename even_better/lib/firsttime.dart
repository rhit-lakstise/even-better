import 'package:flutter/material.dart';

import './main.dart';

class FirstTime extends StatelessWidget {
  const FirstTime({Key? key}) : super(key: key);

  void _login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: _login, child: const Text("Login")),
              ElevatedButton(onPressed: _login, child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
