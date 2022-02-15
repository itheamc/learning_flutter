import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_flutter/handlers/image_handler.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  XFile? _image;
  List<XFile>? _images;

  _pickImage() async {
    _image = await ImagePickerHandler.pick_image();
    setState(() {});
  }

  _pickImages() async {
    _images = await ImagePickerHandler.pick_images();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (_image != null)
                Image.file(File(_image?.path ?? "")),
              if (_images != null)
                ...List.generate(_images!.length, (index) => SizedBox(
                  height: 240.0,
                  child: Image.file(File(_images![index].path ?? ""),
                ))),
              ElevatedButton(onPressed: _pickImage, child: Text("Pick Single Image")),
              ElevatedButton(onPressed: _pickImages, child: Text("Pick Multiple Images")),
            ],
          ),
        ),
      ),
    );
  }
}
