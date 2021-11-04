import 'package:even_better/post/addpost.dart';
import 'package:even_better/profile/profile_change.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileApp extends StatefulWidget {
  @override
  ProfileAppState createState() => ProfileAppState();
}

class ProfileAppState extends State<ProfileApp> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final picker = ImagePicker();
  bool _update = false;
  File? _image;
  String _company = ' ';
  bool cs = true;
  bool se = false;
  bool ds = false;
  String _name = 'Yolanda White';
  String _bio = ' ';

  // SizedBox sb = _noupdateProfile();

  ProfileAppState();
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Even Better',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 35.0,
            color: Color(0xFFF48FB1),
          ),
        ),

        //<Widget>[]
        backgroundColor: const Color(0xFFEDF0F6),
        elevation: 20.0,
        //IconButton
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xffee0000), Color(0xffeeee00)],
                )),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 8.0,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.red[300],
                              child: _image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                        _image!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Username: chenx16",
                              style: TextStyle(
                                fontFamily: 'EB',
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                            // IconButton(
                            //   icon: const Icon(
                            //     Icons.edit_rounded,
                            //     color: Colors.white,
                            //   ),
                            //   onPressed: () => setState(() {
                            //      sb = _updateProfile();
                            //   }),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 0.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          color: Colors.red[400],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          fontSize: 18.0,
                                          color: Colors.red[300],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          color: Colors.red[400],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        "20",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          fontSize: 18.0,
                                          color: Colors.red[300],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Follow",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          color: Colors.red[400],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        "10",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          fontSize: 18.0,
                                          color: Colors.red[300],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Company",
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          color: Colors.red[400],
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        _company,
                                        style: TextStyle(
                                          fontFamily: 'EB',
                                          fontSize: 18.0,
                                          color: Colors.red[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        'Major(s): ',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'EBI',
                            fontSize: 20.0),
                      ),
                      Text(
                        _major(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'EB',
                          color: Colors.black87,
                          letterSpacing: 1.0,
                        ),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        'Name: ',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'EBI',
                            fontSize: 20.0),
                      ),
                      Text(
                        _name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'EB',
                          color: Colors.black87,
                          letterSpacing: 1.0,
                        ),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        'Bio: ',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'EBI',
                            fontSize: 20.0),
                      ),
                      Text(
                        _bio,
                        // 'I have graduated from Rose-Hulman CS major for 10 years. If you need any mobile app for your company then contact me for more informations.'
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'EB',
                          color: Colors.black87,
                          letterSpacing: 1.0,
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            // sb
            _updateProfile()
          ],
        ),
      ),
    );
  }

  String _major() {
    String str = '';
    if (cs) {
      str = str + 'CS,';
    }
    if (se) {
      str = str + 'SE,';
    }
    if (ds) {
      str = str + 'DS,';
    }
    if (str != null && str.isNotEmpty) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final Prof _r = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileUpdate(
            _company,
            _name,
            _bio,
            cs,
            se,
            ds,
          ),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      _company = _r.company!;
      _name = _r.name!;
      _bio = _r.bio!;
      cs = _r.cs!;
      se = _r.se!;
      ds = _r.ds!;
      _major();
    });
  }

  _imgFromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _imgFromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Widget _updateProfile() {
    return SizedBox(
      width: 150.00,
      height: 45,
      child: RaisedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => ProfileUpdate(),
            //   ),
            // );
            _awaitReturnValueFromSecondScreen(context);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          elevation: 0.0,
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[Color(0xffee0000), Color(0xffeeee00)]),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 45.0),
              alignment: Alignment.center,
              child: const Text(
                "Update",
                style: TextStyle(
                  fontFamily: 'EB',
                  color: Colors.white,
                  fontSize: 26.0,
                ),
              ),
            ),
          )),
    );
  }
}

Widget _noupdateProfile() {
  return SizedBox(
    width: 200.00,
  );
}
