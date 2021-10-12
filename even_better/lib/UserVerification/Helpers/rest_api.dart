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

void registerEB(username, password, roseUsername) {
  if (password == password) {
    //TODO: add new credentials to firebase
    print("registration time!");
    _createAlbumRegisterEB(username, password, roseUsername);
  } else {
    //TODO: tell the user the password does not match
  }
}

Future<Album> _createAlbumRegisterEB(username, password, roseUsername) async {
  final response = await http.post(
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
  if (response.statusCode == 200 || response.statusCode == 201) {
    Album output = Album.fromJson(jsonDecode(response.body));
    print('signed up ${output.username} with id: ${output.id} ');
    return output;
  } else {
    throw Exception('failed to create album');
  }
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
