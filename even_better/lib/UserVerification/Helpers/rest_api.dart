import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^

class Album {
  final String id;
  final String username;
  final String roseUsername;
  final String password;
  final friends;

  Album(
      {required this.id,
      required this.username,
      required this.password,
      required this.roseUsername,
      required this.friends});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['_id'],
      username: json['username'],
      roseUsername: json['rose-username'],
      password: json['password'],
      friends: json['friends'],
    );
  }
}

//probably want to change this to only save username
void registerRose(roseUsername, password) {
  //check if username is unique -- could do this in the node call potentially
  //or maybe firebase will send back that it was a repeat username

  if (true) {
    //TODO: add new credentials to firebase with node call
    print("registration time!");
    // createAlbumRegisterRose(roseUsername, password);
    _loadRoseFireWebPage();
  } else {
    //TODO: tell the user the password does not match
  }
}

_loadRoseFireWebPage() async {
  // const url = "https://google.com";
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}


//make this private but still usable in test case??
// Future<Album> createAlbumRegisterRose(roseUsername, password) async {
//   final response = await http.post(
//     Uri.parse('http://137.112.229.126:3000/rosefire/rose_login'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//         <String, String>{'rose-username': roseUsername, 'password': password}),
//   );
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     Album output = Album.fromJson(jsonDecode(response.body));
//     print('signed up ${output.username} with id: ${output.id} ');
//     return output;
//   } else {
//     print("status code: " + response.statusCode.toString());
//     throw Exception('failed to create album');
//   }
// }

// void loginEB(username, password) {
//   //verify account with our FireBase
//   //if can be updated on node server, then this can stay the same
//   _createAlbumLoginEB(username, password);
//   print("Even better username: ${username}");
// }

// Future<http.Response> _createAlbumLoginEB(username, password) {
//   return http.post(
//     Uri.parse(
//         'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/users/signup'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'username': username,
//       'password': password,
//     }),
//   );
// }