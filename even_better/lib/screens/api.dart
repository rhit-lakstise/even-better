import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

//documentation: https://flutter.dev/docs/cookbook/networking/send-data
//if we need to work with responses, add stuff from here ^

void createPost(title, description, url, likes, time) {
  _createPost(title, description, url, likes, time);
  print("post url ${url}");
}

Future<http.Response> _createPost(title, description, url, likes, time) {
  print("Even better username: ");
  return http.post(
    Uri.parse(
        'http://ec2-3-137-199-220.us-east-2.compute.amazonaws.com:3000/posts/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "_id": "0000000000001",
      "title": title,
      "description": description,
      "picture-uri": url,
      "likes": 0.toString(),
      "__v": 0.toString(),
      "timestamp": time
    }),
  );
}
//https://stackoverflow.com/questions/49914136/how-to-integrate-flutter-app-with-node-js
//https://medium.com/flutter/some-options-for-deserializing-json-with-flutter-7481325a4450
