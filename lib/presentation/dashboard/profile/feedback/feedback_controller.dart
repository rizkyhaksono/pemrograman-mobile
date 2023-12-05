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
      if (titleController.text.isNotEmpty) {
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
        print("DatabaseController:: storeFeedback $result");
      } else {
        Get.snackbar(
          'Input Error',
          'Name cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
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
