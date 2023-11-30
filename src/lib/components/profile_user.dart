import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';

class ProfileUser extends StatefulWidget {
  final bool showButton;
  const ProfileUser({
    this.showButton = false,
    super.key,
  });

  @override
  State<ProfileUser> createState() => _ProfileUser();
}

class _ProfileUser extends State<ProfileUser> {
  XFile? imageFile;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance.ref();
  String imageUrl = "";

  Future<void> _openGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        File file = File(pickedFile.path);
        await pickAndCropImage(file, currentUser);
      }
    }
  }

  Future<void> pickAndCropImage(File file, User currentUser) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: LocaleKeys.crop.tr(),
          toolbarColor: primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
      ],
    );

    if (croppedFile != null) {
      String downloadUrl =
          await uploadImageToStorage(File(croppedFile.path), currentUser);
      await updateProfileImage(downloadUrl, croppedFile);
    }
  }

  Future<String> uploadImageToStorage(File imageFile, User currentUser) async {
    Reference imageRef = _storage.child('profile_images/${currentUser.uid}');
    await imageRef.putFile(imageFile);
    String downloadUrl = await imageRef.getDownloadURL();

    return downloadUrl;
  }

  Future<void> updateProfileImage(
      String downloadUrl, CroppedFile croppedFile) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'profile_image': downloadUrl,
        });

        setState(() {
          imageUrl = downloadUrl;
        });
        print('Profile picture updated');
      } catch (e) {
        print('Error updating profile picture: $e');
        // Handle error updating profile picture
      }
    }
  }

  Future<void> _loadImageUrlFromFirestore() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      setState(() {
        imageUrl = userDoc['profile_image'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImageUrlFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 134,
          width: 134,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipOval(
              child: imageUrl != ""
                  ? Image.network(
                      imageUrl, // Gunakan URL gambar dari Firebase Storage
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 130,
                        color: Colors.grey,
                      ),
                      backgroundColor: Colors.grey[300],
                    )),
        ),
        if (widget.showButton)
          TextButton(
            onPressed: () {
              _openGallery();
            },
            child: Text(
              LocaleKeys.changePicture,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ).tr(),
          )
      ],
    );
  }
}
