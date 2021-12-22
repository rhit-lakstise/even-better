import 'package:even_better/UserVerification/sign_up.dart';
import 'package:even_better/UserVerification/validate_otp.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Helpers/labeled_text_field.dart';
import 'Helpers/verification_rest_api.dart';

class ValidateRose extends StatefulWidget {
  const ValidateRose({
    Key? key,
  }) : super(key: key);

  @override
  State<ValidateRose> createState() => _ValidateRoseState();
}

class _ValidateRoseState extends State<ValidateRose> {
  final TextEditingController usernameController = TextEditingController();
  var validEmail = true;
  late Future<AlbumValidateRose> futureAlbum;

  void _registerRose(username) {
    //verify account with .csv webscraped file
    futureAlbum = createAlbumValidateRose(username);
    futureAlbum.then((album) => setState(() {
          //worth to check if == "false" ?

          // validEmail = album.message == "true";
          //TODO: COMMENT LINE BELOW AND UNCOMMENT LINE ABOVE
          //Currunt config is for testing with a rose username multiple times
          validEmail = true;

          if (validEmail) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ValidateOtp(roseUsername: username)));
          }
        }));

//for testing
  }

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
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Enter your Rose-Hulman Username")),
            LabeledTextField(
              label: "(exclude @rose-hulman.edu)",
              textEditingController: usernameController,
              isPassword: false,
              isSignUpPassword: false,
              onSubmit: (String val) {},
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: () {
                      _registerRose(usernameController.text);
                    },
                    child: const Text("Continue"))),
            validEmail
                ? Text("")
                //must be error
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text("Invalid Rose-Hulman email, error ",
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}
