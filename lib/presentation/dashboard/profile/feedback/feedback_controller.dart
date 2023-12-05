import 'package:appwrite/appwrite.dart';

import 'package:demo_mobile/utils/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
    // appwrite
    databases = Databases(client);
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  Future storeFeedback() async {
    try {
      if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
        final map = {
          'title': titleController.text,
          'description': descController.text,
        };

        final result = await databases!.createDocument(
          databaseId: "656f48b91249dddb8f39",
          documentId: ID.unique(),
          collectionId: "656f63d893a5ea6639bd",
          data: map,
          permissions: [
            Permission.read(Role.any()),
            Permission.update(Role.any()),
            Permission.delete(Role.any()),
          ],
        );

        if (result != null) {
          // Data berhasil dikirim
          Get.snackbar(
            'Success',
            'Data has been submitted successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        } else {
          // Terjadi kesalahan saat mengirim data
          Get.snackbar(
            'Error',
            'Failed to submit data. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      } else {
        // Menampilkan notifikasi jika ada field yang belum diisi
        Get.snackbar(
          'Input Error',
          'All fields must be filled.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    } catch (error) {
      // Menampilkan notifikasi jika terjadi kesalahan
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      print("DatabaseController:: storeFeedback $error");
    }
  }
}
