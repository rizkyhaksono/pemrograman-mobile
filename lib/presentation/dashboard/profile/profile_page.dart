import 'dart:io';

import 'package:demo_mobile/components/profile_avatar.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends GetView<ProfileController> {
  final File? pickedFile;
  final ImagePicker? imagePicker = ImagePicker();

  ProfilePage({
    super.key,
    this.pickedFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              bottom: 20,
            ),
            child: Text(
              "Profile",
              style: TextStyle(
                fontFamily: Resources.font.primaryFont,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 32,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileAvatar(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Rizky Haksono',
            style: TextStyle(
              color: Resources.color.hightlight,
              fontSize: 24.0,
              fontFamily: Resources.font.primaryFont,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 60,
              right: 60,
            ),
            height: 70,
            width: 40,
            child: ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("test");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Resources.color.hightlight,
                side: BorderSide.none,
                shape: const StadiumBorder(),
              ),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Resources.color.background,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileMenuWidget(
                title: "Setting",
                icon: Icons.settings,
                textColor: Resources.color.hightlight,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Upload File",
                icon: Icons.upload_file,
                textColor: Resources.color.hightlight,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: Icons.manage_accounts,
                textColor: Resources.color.hightlight,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Information",
                icon: Icons.info_rounded,
                textColor: Resources.color.hightlight,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_outlined,
                textColor: Resources.color.hightlight,
                onPress: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width,
            height: 100.0,
            decoration: BoxDecoration(
              // color: Resources.color.darkGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This app made by Rizky Haksono",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Resources.font.primaryFont,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      contentPadding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      leading: Container(
        width: 40,
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Resources.color.hightlight,
        ),
        child: Icon(
          icon,
          color: Resources.color.background,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.arrow_right,
                color: Resources.color.hightlight,
              ),
            )
          : null,
    );
  }
}
