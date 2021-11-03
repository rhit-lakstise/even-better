import 'dart:io';

import 'package:even_better/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'fb_services/auth.dart';
import 'screens/wrapper.dart';
import 'models/user.dart';

void main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const appTitle = "Even Better";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null, //required
      child: MaterialApp(
          title: MyApp.appTitle,
          theme: ThemeData(
            //TODO: make a custom color swatch with the rose color palette
            primarySwatch: Colors.red,
          ),
          home: Wrapper()),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int prot) => true;
//   }
// }

