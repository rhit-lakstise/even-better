import 'package:even_better/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;

void requestLoginEB(String username, String password, context) async {
  //verify account with our FireBase

  print("Even better username: ${username}\n password: ${password}");
  await _auth.signInWithEmailAndPassword(email: username, password: password);
  // loginEB(username, password);
  Navigator.pop(context);
}

void requestSignUpEB(String username, String password, context) async {
  //verify account with our FireBase

  await _auth.createUserWithEmailAndPassword(
      email: username, password: password);
  //pop away the current path!
  Navigator.pop(context);
  Navigator.pop(context);
}
