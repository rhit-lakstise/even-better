import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart';
import '../main.dart';
import 'sign_up.dart';
import 'Helpers/rest_api.dart';

class FirstTime extends StatelessWidget {
  const FirstTime({Key? key}) : super(key: key);

  void _registerRose(username, password, context) {
    print("rose username ${username}");
    //verify account with RoseFire

//for testing
    var credentialsValid = true;

    if (credentialsValid) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUp(
                    roseUsername: username,
                  )));
    }
  }

  void _requestLoginEB(username, password, context) {
    //verify account with our FireBase
    loginEB(username, password);
    print("Even better username: ${username}");
  }

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  label1: "Even Better Username",
                                  label2: "Even Better Password",
                                  submitFunction: _requestLoginEB,
                                )));
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  label1: "Rose-Hulman Username",
                                  label2: "Rose-Hulman Password",
                                  submitFunction: _registerRose,
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
