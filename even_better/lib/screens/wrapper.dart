import 'package:flutter/material.dart';
import '../UserVerification/firsttime.dart';
import 'Authentication/Authenticate.dart';
import 'home/home.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  // dynamically changes what the user sees based on the user login state
  @override
  Widget build(BuildContext context) {
    // when user logs in, a user object will be stored in this variable, set to null if logged out.
    final user = Provider.of<MyUser?>(context);
    print("${user}  [Wrapper]");
    // return either home or authenticate widget
    // return const FirstTime();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
