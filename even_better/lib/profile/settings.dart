import 'package:flutter/material.dart';

import '../fb_services/auth.dart';
import './helpers/settings_rest_api.dart';

class Settings extends StatelessWidget {
  final AuthService auth;

  const Settings(this.auth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",
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
                    //do the deletions!
                    // createAlbumDeleteAccount(auth.user);
                    auth.deleteAccount();
                    auth.signOut();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("Account Deletion is Permanent"),
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
