import 'package:even_better/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../fb_services/auth.dart';
import 'login.dart';
import '../main.dart';
import 'sign_up.dart';
import 'Helpers/rest_api.dart';

class FirstTime extends StatefulWidget {
  FirstTime({Key? key}) : super(key: key);

  @override
  State<FirstTime> createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String error = '';

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

  Future _requestLoginEB(String username, String password, context) async {
    //verify account with our FireBase

    print("Even better username: ${username}\n password: ${password}");
    Future result =
        _auth.signInWithEmailAndPassword(email: username, password: password);
    // loginEB(username, password);
    return result;

    // if (result == null) {
    //   error = 'Could not sign in with these credentials';
    // } else {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    // }
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
                                submitFunction: () async {
                                  setState(() {});
                                  dynamic result = _requestLoginEB;
                                  if (result == null) {}
                                })));
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
              ElevatedButton(
                  child: const Text("Invite Friends"),
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
