import 'package:flutter/material.dart';

class Forum_Answer {
  // i didnt put fid because i think it will be linked thru the forum
  final String aid; //answer_id
  final String uid; //author_id
  String text;
  int likes = 0;

  Forum_Answer(this.aid, this.uid, this.text) {
    print('Forum Answer with uid: ${aid} [Forum_Answer]');
    // print('Forum Answer with answer: ${text} [Forum_Answer]');
  }

  void liked() {
    likes++;
    print('liked the answer');
  }
}

class ForumAnswer extends StatelessWidget {
  final Forum_Answer answers;
  ForumAnswer(this.answers);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red[300],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 50.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(answers.uid),
                      Text(answers.aid),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.thumb_up),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: Text(answers.likes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Container(
                width: double.infinity,
                child: Text(answers.text),
              )),
        ],
      ),
    );
  }
}
