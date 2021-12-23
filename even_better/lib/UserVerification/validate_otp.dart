import 'package:even_better/UserVerification/Helpers/account_creation.dart';
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
  void emailNotValidated() {}

  void checkEmailValidated() {
    createAlbumIsEmailValidated(widget.roseUsername).then((value) {
      print(value);
      // if (notVerified) {
      // modalErrorHandler(value, context, "not verified :(");
      // }
      //  if (isVerified) {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => SignUp(
      //                   roseUsername: widget.roseUsername,
      //                 )));
      //   }
    }).catchError((error) {
      emailNotValidated();
    });

    //verify account with RoseFire
    // futureAlbum = createAlbumValidateOtp(code);
    // futureAlbum.then((album) => setState(() {
    //worth to check if == "false" ?
    validOtp = true;
    //album.message == "true";
    print("rose username in widge: " + widget.roseUsername);

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
            Text(
              "A confirmation link has been sent to your email.\nClick it to continue",
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                    onPressed: () {
                      //validate OTP!!
                      checkEmailValidated();
                    },
                    child: const Text("Confirm Email Validation"))),
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
