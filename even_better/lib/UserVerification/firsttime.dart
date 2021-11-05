import 'package:even_better/UserVerification/validate_rose.dart';
import 'package:flutter/material.dart';

import './Helpers/firebase.dart';
import 'login.dart';
import '../main.dart';
import 'sign_up.dart';
import './Helpers/rest_api.dart';

class FirstTime extends StatefulWidget {
  const FirstTime({Key? key}) : super(key: key);

  @override
  State<FirstTime> createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  String error = '';

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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ValidateRose()));
                  }),
              // ElevatedButton(
              //     child: const Text("Invite Friends"),
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => const Login()));
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
