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
            'Sukses 😃',
            'Data Anda Telah Terekam Dalam Database!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
          );
          titleController.clear();
          descController.clear();
        }
      } else {
        // Menampilkan notifikasi jika ada field yang belum diisi
        Get.snackbar(
          'Inputan Kosong',
          'Semua kolom harus terisi',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
        );
      }
    } catch (error) {
      // Menampilkan notifikasi jika terjadi kesalahan
      Get.snackbar(
        'Error',
        'Terjadi Kesalahan! Silahkan Coba Lagi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
      print("DatabaseController:: storeFeedback $error");
    }
  }
}
