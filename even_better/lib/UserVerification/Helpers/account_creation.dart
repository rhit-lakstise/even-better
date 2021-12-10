import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import "./verification_rest_api.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;

//intermediary functions that communicate with FirebaseAuth. Could merge these together if we wanted to

void modalErrorHandler(error, context, title) {
  print(error);
  //pop up modal to show failure!

  Widget cancelButton = TextButton(
    child: const Text("DISMISS"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(error.toString().split("] ")[1]),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void requestLoginEB(String username, String password, context) async {
  //verify account with our FireBase

  print("Even better username: ${username}\n password: ${password}");
  _auth
      .signInWithEmailAndPassword(email: username, password: password)
      .then((val) {
    // loginEB(username, password).then
    Navigator.pop(context);
  }).catchError((error) {
    modalErrorHandler(error, context, "Login Failure");
  });
}

void requestSignUpEB(
    String username, String password, String roseUsername, context) async {
  //verify account with our FireBase

  _auth
      .createUserWithEmailAndPassword(email: username, password: password)
      .then((val) {
    if (val.user?.email == username) {
      //TODO make this work when the node server is fixed

      // createAlbumSignUpEB(username, roseUsername).then((value) =>

      // );
      //pop to the homescreen
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }).catchError((error) {
    modalErrorHandler(error, context, "Account Creation Failure");
  });

  //pop away the current path!
}
