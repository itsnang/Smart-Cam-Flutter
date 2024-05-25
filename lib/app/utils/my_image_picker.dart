// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage({
    required ImageSource source,
    bool isCrop = false,
  }) async {
    final image = await _picker.pickImage(source: source);
    final path = image?.path;
    debugPrint('image pick: $path');

    if (path == null) {
      return path;
    }

    return path;
  }
}
