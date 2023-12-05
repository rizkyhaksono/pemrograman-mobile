import 'package:demo_mobile/components/profile_avatar.dart';
import 'package:demo_mobile/presentation/dashboard/profile/edit_profile/edit_profile_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_mobile/utils/database_controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  final DatabaseController databaseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Resources.color.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileAvatar(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  controller.nameController.text = value;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Resources.color.hightlight,
                  ),
                  fillColor: Resources.color.hightlight,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                ),
                style: TextStyle(color: Resources.color.hightlight),
                initialValue: databaseController.documents.isNotEmpty
                    ? databaseController.documents[0].data['name'] ?? ''
                    : '',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  controller.emailController.text = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Resources.color.hightlight,
                  ),
                  fillColor: Resources.color.hightlight,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                ),
                style: TextStyle(color: Resources.color.hightlight),
                keyboardType: TextInputType.emailAddress,
                initialValue: databaseController.documents.isNotEmpty
                    ? databaseController.documents[0].data['email'] ?? ''
                    : '',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  controller.phoneController.text = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color: Resources.color.hightlight,
                  ),
                  fillColor: Resources.color.hightlight,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Resources.color.hightlight),
                  ),
                ),
                style: TextStyle(color: Resources.color.hightlight),
                initialValue: databaseController.documents.isNotEmpty
                    ? databaseController.documents[0].data['phone'] ?? ''
                    : '',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Get.snackbar('Success', 'Profile Updated!');
                  print("Name: ${controller.nameController.text}");
                  print("Email: ${controller.emailController.text}");
                  print("Phone: ${controller.phoneController.text}");

                  Map<String, dynamic> updatedData = {
                    'name': controller.nameController.text,
                    'email': controller.emailController.text,
                    'phone': controller.phoneController.text,
                  };

                  await databaseController.databases!.updateDocument(
                    databaseId: "656f48b91249dddb8f39",
                    collectionId: "656f48e8972dfe420f62",
                    documentId: databaseController.documents[0].$id,
                    data: updatedData,
                  );

                  Get.snackbar('Success', 'Profile Updated!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Resources.color.hightlight,
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Resources.color.background),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool confirmed = await showDeleteConfirmationDialog(context);
                  if (confirmed) {
                    await deleteCurrentUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Resources.color.background),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Account'),
              content: const Text(
                  'Are you sure you want to delete your account? This action cannot be undone.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> deleteCurrentUser() async {
    await databaseController.databases!.deleteDocument(
      databaseId: "656f48b91249dddb8f39",
      collectionId: "656f48e8972dfe420f62",
      documentId: databaseController.documents[0].$id,
    );

    Get.offAllNamed('/login');
  }
}
