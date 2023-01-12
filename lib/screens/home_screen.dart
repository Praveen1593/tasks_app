import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.kindacode.com/wp-content/uploads/2021/01/blue.jpg',
            ),
          )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
          title: Text("Image Picker"),
           backgroundColor: Colors.indigo,
                ),
                   body: Container(
                      child: imageFile == null
                         ? Container(
      alignment: Alignment.center,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      ElevatedButton(

        onPressed: () {
          _getFromGallery();
        },
        child: Text("PICK FROM GALLERY"),
      ),
        Container(
          height: 40.0,
        ),
        ElevatedButton(
         // color: Colors.lightGreenAccent,
          onPressed: () {
            _getFromCamera();
          },
          child: Text("PICK FROM CAMERA"),
        )
      ],
      ),

      ): Container(
        child: Image.file(
          imageFile!,
          fit: BoxFit.cover,
        ),
      ),

                   )),
    );
  }
  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}