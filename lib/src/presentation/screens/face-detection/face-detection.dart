import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/src/core/constant/AppAsset.dart';
import 'package:student/src/core/constant/AppColor.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;
  List<Face> faces = [];

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _detetFaces(File image) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final inputImage = InputImage.fromFilePath(image.path);
    faces = await faceDetector.processImage(inputImage);

    setState(() {});

    print(faces.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: MediaQuery.sizeOf(context).width * .25,
              backgroundColor: AppColor.secondary,
              child: CircleAvatar(
                maxRadius: MediaQuery.sizeOf(context).width * .24,
                backgroundImage: _image != null
                    ? FileImage(_image!) as ImageProvider<Object>
                    : const AssetImage(AppAsset.placeholder),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    "Number of faces: ${faces.length}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppColor.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                    onPressed: () {
                      _pickImage(ImageSource.gallery).then((value) =>
                          {if (_image != null) _detetFaces(_image!)});
                    },
                    child: const Icon(
                      Icons.photo_library,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppColor.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                    onPressed: () {
                      _pickImage(ImageSource.camera).then((value) =>
                          {if (_image != null) _detetFaces(_image!)});
                    },
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 30,
                      // "Take a photo",
                      // style: TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
