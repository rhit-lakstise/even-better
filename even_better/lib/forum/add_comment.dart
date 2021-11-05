import 'package:even_better/models/forum_answer.dart';
import 'package:even_better/models/forum_post.dart';
import 'package:flutter/material.dart';

class commentForum extends StatefulWidget {
  Forum_Post forum;
  commentForum(this.forum);
  @override
  _commentForumState createState() => _commentForumState(forum);
}

class _commentForumState extends State<commentForum> {
  final _formKey = GlobalKey<FormState>();
  String text = '';
  Forum_Post forum;
  _commentForumState(this.forum);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          elevation: 0.0,
          title: const Text('What do you think?'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey, //keep track of the form
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Comment here',
                      ),
                      validator: (val) => val!.isEmpty
                          ? 'Enter your thoughts'
                          : null, //is valid if null
                      onChanged: (val) {
                        setState(() => text = val);
                      }),
                  RaisedButton(
                      color: Colors.red[400],
                      child: const Text(
                        'Comment',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print(text);
                          // TODO: implement submit comment
                          forum.add_comment(
                              Forum_Answer("answer6", "morrison jamari", text));
                          Navigator.of(context).pop();
                        }
                      }),
                ]))));
  }
}
