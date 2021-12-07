import 'package:even_better/main.dart';
import 'package:flutter/material.dart';

import '../fb_services/auth.dart';

class DeletionDialog extends StatelessWidget {
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
      body: Container(),
    );
  }
}
