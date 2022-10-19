import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final File? imageFile;

  ImageWidget({this.imageFile});

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      //selected image
      return Image.file(
        imageFile!,
        height: MediaQuery.of(context).size.height / 3,
        alignment: Alignment.center,
        width: double.maxFinite,
      );
    } else {
      //placeholder image
      return Image.asset(
        "assets/placeholder.jpg",
        height: MediaQuery.of(context).size.height / 3,
        alignment: Alignment.center,
        width: double.maxFinite,
      );
    }
  }
}
