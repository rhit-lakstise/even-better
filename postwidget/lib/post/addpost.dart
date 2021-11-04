import 'dart:io';
import 'package:even_better/post/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:even_better/screens/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImageFromGalleryEx extends StatefulWidget {
  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState();

  build(BuildContext context) {}
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final picker = ImagePicker();
  File? _image;

  ImageFromGalleryExState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    postController.dispose();
    super.dispose();
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Even Better',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 35.0,
            color: Color(0xFFF48FB1),
          ),
        ),
        //<Widget>[]
        backgroundColor: Colors.grey[200],
        elevation: 50.0,
        //IconButton
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.white,
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image!,
                              width: 500,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          )
                        //   child: _image != null
                        //       ? Image.file(_image, fit: BoxFit.cover)
                        //       : Text('Please select an image'),
                        // )
                        : Container(
                            margin: const EdgeInsets.only(
                                left: 10, top: 10, right: 10, bottom: 10),
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            // decoration: BoxDecoration(
                            //     color: Colors.grey[200],
                            //     borderRadius: BorderRadius.circular(20)),
                            // width: 500,
                            // height: 500,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.redAccent[200],
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _descriptionTile(titleController),
                      SizedBox(height: 30),
                      _contentTile(
                        postController,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.00,
                margin: EdgeInsets.all(25),
                child: TextButton(
                  child: Text(
                    'Create',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Festive',
                        color: Colors.white,
                        fontSize: 32.0),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {
                    DateTime now = DateTime.now();
                    String formattedDate =
                        DateFormat('yyyy-MM-dd kk:mm').format(now);
                    print(formattedDate);
                    createPost(
                        titleController.text.replaceAll('\n', ' '),
                        postController.text.trim(),
                        _image!.path,
                        0,
                        formattedDate);
                    Navigator.pop(
                        context,
                        NewPost(
                            formattedDate,
                            _image!.path,
                            titleController.text.replaceAll('\n', ' '),
                            postController.text.trim()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _descriptionTile(TextEditingController titleController) {
  return ListTileTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      tileColor: Colors.grey[200],
      leading: Icon(Icons.edit),
      title: Text(
        'Post Title',
        style: TextStyle(
            fontFamily: 'EB',
            height: 2,
            color: Colors.grey[800],
            fontSize: 20.0),
      ),
      subtitle: TextField(
        controller: titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter...',
        ),
        // decoration: InputDecoration(
        //   border: InputBorder.none,

        // ),
        //keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 2,
        maxLength: 44,
      ),
    ),
  );
}

Widget _contentTile(TextEditingController postController) {
  return Column(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16),
      // ),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Colors.grey[200],
          leading: Icon(Icons.edit),
          title: Text(
            'Post Content',
            style: TextStyle(
                fontFamily: 'EB',
                height: 2,
                color: Colors.grey[800],
                fontSize: 20.0),
          ),
          subtitle: TextField(
            controller: postController,
            // decoration: InputDecoration(
            //   border: InputBorder.none,
            //   hintText: 'Enter...',
            // ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter...',
            ),
            //keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            maxLength: 300,
          ),
        ),
      ]);
}

class NewPost {
  String timeAgo;
  String imageUrl;
  String title;
  String content;

  NewPost(this.timeAgo, this.imageUrl, this.title, this.content);
}
