import 'dart:io';

import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatelessWidget {
  File? pickedFile;
  final ImagePicker imagePicker = ImagePicker();

  final ProfileController _profileController = Get.find();

  ProfileAvatar({
    super.key,
    this.pickedFile,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => CircleAvatar(
            backgroundImage: _profileController.isProficPicPathSet.value == true
                ? FileImage(File(_profileController.profilePicPath.value))
                    as ImageProvider
                : AssetImage("assets/images/profile.jpg"),
            radius: 80,
          ),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            child: const Icon(Icons.camera),
            onTap: () {
              if (kDebugMode) {
                print("Camera clicked");
              }
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                backgroundColor: Resources.color.background,
                builder: (context) => bottomSheet(context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Resources.color.background,
      height: size.height * 0.2,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Resources.color.hightlight,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      color: Resources.color.hightlight,
                      size: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 18,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      color: Resources.color.hightlight,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 18,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      Get.snackbar(
        "Image Pick Canceled",
        "You canceled image selection",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      if (kDebugMode) {
        print("Image pick operation canceled by the user.");
      }

      return;
    }

    pickedFile = File(pickedImage!.path);
    _profileController.setProfileImagePath(pickedFile!.path);

    Get.back();

    Get.snackbar(
      "Image Pick Successfully",
      "You success change image",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    if (kDebugMode) {
      print(pickedFile);
    }
  }
}
