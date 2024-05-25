import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:update_her/app/utils/my_image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            _image != null
                ? Image.file(
                    File(_image!),
                    width: 200,
                    height: 200,
                  )
                : Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey,
                  ),
            ElevatedButton(
                onPressed: () async {
                  setState(() async {
                    _image = await onAddImageTap();
                  });
                },
                child: Text('Open Cam')),
          ],
        ),
      ),
    );
  }
}

Future<String?> onAddImageTap() async {
  final image = await MyImagePicker().pickImage(
    source: ImageSource.camera,
    isCrop: true,
  );
  log('image: $image');

  return image;
}
