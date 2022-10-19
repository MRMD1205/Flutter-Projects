import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static Future<File?> pickImage(ImageSource source) async {
    File? imageFile;
    ImagePicker _picker = ImagePicker();
    PickedFile? pickedFile = await _picker.getImage(source: source);
    imageFile = File(pickedFile!.path);
    return imageFile;
  }

  static Future<File?> _cropImage(File? imageFile) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        // aspectRatioPresets: Platform.isAndroid
        //     ? [
        //         CropAspectRatioPreset.square,
        //         CropAspectRatioPreset.ratio3x2,
        //         CropAspectRatioPreset.original,
        //         CropAspectRatioPreset.ratio4x3,
        //         CropAspectRatioPreset.ratio16x9
        //       ]
        //     : [
        //         CropAspectRatioPreset.original,
        //         CropAspectRatioPreset.square,
        //         CropAspectRatioPreset.ratio3x2,
        //         CropAspectRatioPreset.ratio4x3,
        //         CropAspectRatioPreset.ratio5x3,
        //         CropAspectRatioPreset.ratio5x4,
        //         CropAspectRatioPreset.ratio7x5,
        //         CropAspectRatioPreset.ratio16x9
        //       ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            backgroundColor: Color(0xFFE5E5E5),
            toolbarColor: Color(0xFFE5E5E5),
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        ));
    return croppedFile;
  }
}
