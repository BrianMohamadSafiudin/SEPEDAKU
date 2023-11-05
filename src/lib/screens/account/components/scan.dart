import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sepedaku/components/button_inScan.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/main.dart';
import 'package:sepedaku/screens/account/components/detailScan.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController controller;
  XFile? imageFile;
  bool isFlashOn = false;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    if (isFlashOn) {
      controller.setFlashMode(FlashMode.always);
    } else {
      controller.setFlashMode(FlashMode.off);
    }
  }

  Future<void> _takePicture() async {
    if (!controller.value.isInitialized) {
      return;
    }

    try {
      XFile file = await controller.takePicture();
      if (file != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: file.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: LocaleKeys.crop.tr(),
                toolbarColor: primaryColor,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
          ],
        );
        if (croppedFile != null) {
          setState(() {
            imageFile = XFile(croppedFile.path);
          });
        }
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _openGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: LocaleKeys.crop.tr(),
              toolbarColor: primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          imageFile = XFile(croppedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                press: () {
                  setState(() {
                    isFlashOn = !isFlashOn;
                    _toggleFlash();
                  });
                },
                icon: isFlashOn ? Icons.flash_on : Icons.flash_off,
                colorIcon: Colors.white,
                colorBorder: primaryColor,
              ),
              CircleButton(
                press: () {
                  _openGallery();
                },
                icon: Icons.photo_library,
                colorIcon: Colors.white,
                colorBorder: primaryColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: size.height * 0.7199,
            width: double.infinity,
            child: imageFile != null
                ? Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.contain,
                  )
                : CameraPreview(controller),
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        height: size.height * 0.16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                press: () {
                  Navigator.pop(context);
                },
                icon: Icons.close,
                colorBorder: Colors.white,
                colorIcon: primaryColor,
              ),
              if (imageFile == null)
                CircleButton(
                  press: () {
                    _takePicture();
                  },
                  icon: Icons.camera_alt,
                  colorBorder: Colors.white,
                  colorIcon: primaryColor,
                ),
              CircleButton(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScanScreen();
                  }));
                },
                icon: Icons.check,
                colorBorder: Colors.white,
                colorIcon: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
