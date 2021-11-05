import 'package:http/http.dart' as http;
import 'dart:convert';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^
//https://stackoverflow.com/questions/49914136/how-to-integrate-flutter-app-with-node-js
//https://medium.com/flutter/some-options-for-deserializing-json-with-flutter-7481325a4450

// ----------------------------------------------------------------
// create post
const String serverURL =
    "http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000";

void createForum(title, poster, content, time, tags) {
  _createPost(title, poster, content, time, tags);
  print("creating forum [connect]");
}

Future<http.Response> _createPost(title, poster, content, time, tags) {
  return http.post(
    Uri.parse(serverURL + "/forums/create"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "title": title,
      "poster": poster,
      "content": content,
      "timestamp": time,
      "tags": tags,
    }),
  );
}
//----------------------------------------------------------------
