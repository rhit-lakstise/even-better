import 'package:even_better/UserVerification/sign_up.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Helpers/labeled_text_field.dart';
import 'Helpers/verification_rest_api.dart';

class ValidateOtp extends StatefulWidget {
  const ValidateOtp({
    required this.roseUsername,
    Key? key,
  }) : super(key: key);
  final String roseUsername;
  @override
  State<ValidateOtp> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp> {
  final TextEditingController codeController = TextEditingController();
  var validOtp = true;
  late Future<AlbumValidateRose> futureAlbum;
  void _verifyOtp(code) {
    //verify account with RoseFire
    // futureAlbum = createAlbumValidateOtp(code);
    // futureAlbum.then((album) => setState(() {
    //worth to check if == "false" ?
    validOtp = true;
    //album.message == "true";
    print("rose username in widge: " + widget.roseUsername);
    if (validOtp) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUp(
                    roseUsername: widget.roseUsername,
                  )));
    }
    // }));

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
            LabeledTextField(
              label: "Enter code from email address",
              textEditingController: codeController,
              isPassword: false,
              isSignUpPassword: false,
              onSubmit: (String val) {},
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: () {
                      //validate OTP!!
                      _verifyOtp(codeController.text);
                    },
                    child: const Text("Continue"))),
            validOtp
                ? Text("")
                //must be error
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text("Invalid code",
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
