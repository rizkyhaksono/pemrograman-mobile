import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:demo_mobile/utils/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          filename: 'image.jpg',
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
}
