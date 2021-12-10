import 'package:http/http.dart' as http;
import 'dart:convert';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^

class Album {
  final String message;

  Album({
    required this.message,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    // print(json['message']);
    return Album(
      //for whatever reason dynamic makes this parse directly to a boolean :(
      message: json['message'] ? "true" : "false",
    );
  }
}

//probably want to change this to only save username
// bool registerRose(roseUsername) {
//   //check if username is unique -- could do this in the node call potentially
//   //or maybe firebase will send back that it was a repeat username
//   //TODO: add new credentials to firebase with node call
//   print("registration time!");
//   bool valid = createAlbumValidateRose(roseUsername);
//   print(valid);
//   return valid;
//   // createAlbumRegisterRose(roseUsername, password);
// }

//make this private but still usable in test case??
Future<Album> createAlbumValidateRose(roseUsername) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/students/checkExist'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'rose-username': roseUsername}),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    Album output = Album.fromJson(jsonDecode(response.body));
    print("message is: " + output.message);
    return output;
  } else {
    print("status code: " + response.statusCode.toString());
    throw Exception('failed to create album');
  }
}

//TODO: implement me!!
Future<Album> createAlbumValidateOtp(code) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/students/validatecode'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'code': code}),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    Album output = Album.fromJson(jsonDecode(response.body));
    print("message is: " + output.message);
    return output;
  } else {
    print("status code: " + response.statusCode.toString());
    throw Exception('failed to create album');
  }
}

Future<Album> createAlbumSignUpEB(username, roseUsername) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'rose-username': roseUsername,
    }),
  );
  //NEED TO HANDLE THIS ALBUM BETTER
  if (response.statusCode == 200 || response.statusCode == 201) {
    Album output = Album.fromJson(jsonDecode(response.body));
    print("message is: " + output.message);
    return output;
  } else {
    print("status code: " + response.statusCode.toString());
    throw Exception('failed to create album');
  }
}
