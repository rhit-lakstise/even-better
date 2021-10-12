import 'package:http/http.dart' as http;
import 'dart:convert';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^

void registerEB(username, password, roseUsername) {
  if (password == password) {
    //TODO: add new credentials to firebase
    print("registration time!");
    _createAlbumRegisterEB(username, password, roseUsername);
  } else {
    //TODO: tell the user the password does not match
  }
}

Future<http.Response> _createAlbumRegisterEB(username, password, roseUsername) {
  return http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'rose-username': roseUsername,
      'password': password,
    }),
  );
}

void loginEB(username, password) {
  //verify account with our FireBase
  _createAlbumLoginEB(username, password);
  print("Even better username: ${username}");
}

Future<http.Response> _createAlbumLoginEB(username, password) {
  return http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
}
