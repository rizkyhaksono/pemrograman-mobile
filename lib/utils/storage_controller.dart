import 'dart:io';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:demo_mobile/utils/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class StorageController extends ClientController {
  Storage? storage;
  @override
  void onInit() {
    super.onInit();
    storage = Storage(client);
  }

  Future storeImage(File file) async {
    try {
      final result = await storage!.createFile(
        bucketId: '656f494910effa16762c',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path: file.path,
          filename: "image.jpg",
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> fetchImage(String fileId) async {
    final response = await storage?.getFile(
      fileId: fileId,
      bucketId: '656f494910effa16762c',
    );

    // Check if the response is successful
    if (response != null) {
      // Save the fetched image to the device
      final byteData = await response.toString();
      // final file = await saveImage(byteData, 'profile_image.png');

      print(byteData);
    } else {
      print('Error fetching image');
    }
  }

  // Future<File> saveImage(ByteData byteData, String filename) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = directory.path + '/' + filename;
  //   final file = File(path);
  //   await file.writeAsBytes(byteData.buffer.asUint8List());
  //   return file;
  // }
}
