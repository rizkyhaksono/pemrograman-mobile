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
          filename: "image.jpg",
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchImage(String fileId) async {
    final response = await storage?.getFile(
      fileId: fileId,
      bucketId: '656f494910effa16762c',
    );

    if (response != null) {
      final byteData = await response.toString();
      print(byteData);
    } else {
      print('Error fetching image');
    }
  }
}
