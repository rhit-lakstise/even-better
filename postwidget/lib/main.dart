import 'package:flutter/material.dart';
import 'package:even_better/post/feed_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent[200],
        dividerColor: Colors.redAccent[300],
      ),
      title: 'Even Better',
      home: FeedScreen(),
    );
  }
}
