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

  final ProfileController _profileController = Get.put(ProfileController());

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
          () {
            bool isImagePathAvailable =
                _profileController.isProficPicPathSet.value;
            String imagePath = _profileController.profilePicPath.value;

            ImageProvider<Object>? backgroundImage;
            if (isImagePathAvailable) {
              backgroundImage = FileImage(File(imagePath));
            } else {
              backgroundImage = AssetImage("assets/images/profile.jpg");
            }

            return CircleAvatar(
              radius: 80,
              backgroundImage: backgroundImage,
            );
          },
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
                  _profileController.takePhoto(ImageSource.gallery, pickedFile);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      color: Resources.color.hightlight,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
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
                  _profileController.takePhoto(ImageSource.camera, pickedFile);
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
}
