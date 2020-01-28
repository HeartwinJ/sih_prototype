import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileEditPage extends StatefulWidget {
  @override
  _MyProfileEditPageState createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends State<MyProfileEditPage>{
  var _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.values[1]
    );

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Edit Profile'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: getImage,
        ),
        body: Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(_image),
        ),
      ),
    );
  }
}
