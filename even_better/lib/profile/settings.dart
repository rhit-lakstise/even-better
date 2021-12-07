import 'package:even_better/main.dart';
import 'package:flutter/material.dart';

import '../fb_services/auth.dart';
import 'deletion_dialog.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.appTitle,
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 35.0,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            ElevatedButton(
              onPressed: () {
                Widget cancelButton = TextButton(
                  child: Text("CANCEL"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
                Widget continueButton = TextButton(
                  child: Text("DELETE"),
                  onPressed: () {
                    _auth.deleteAccount();
                    _auth.signOut();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("Account deletion is permanent"),
                  actions: [
                    cancelButton,
                    continueButton,
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
                // Navigator.pop(context);
              },
              child: Text('Delete Account'),
            )
          ],
        ),
      ),
    );
  }
}
