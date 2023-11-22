import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxBool isProficPicPathSet = false.obs;
  RxString profilePicPath = "".obs;

  File? pickedFile;
  final ImagePicker imagePicker = ImagePicker();

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    String? storedImagePath = await getStoredImagePath();
    if (storedImagePath != null && storedImagePath.isNotEmpty) {
      setProfileImagePath(storedImagePath);
    }
  }

  Future<String?> getStoredImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileImagePath');
  }

  Future<String?> setStoredImagePath({localImage}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', localImage.path);
    return null;
  }

  Future<void> takePhoto(ImageSource source, File? pickedFile) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      return;
    } else {
      final Directory appDirectory = await getApplicationCacheDirectory();
      const String fileName = 'profile_image.png';

      setProfileImagePath(File(pickedImage.path).path);
      setStoredImagePath(
          localImage: await File(pickedImage.path)
              .copy('${appDirectory.path}/$fileName'));

      Get.back();
      Get.snackbar(
        "Image Pick Successfully",
        "You success change image",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  var githubRizky = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://github.com/rizkyhaksono'));
}
