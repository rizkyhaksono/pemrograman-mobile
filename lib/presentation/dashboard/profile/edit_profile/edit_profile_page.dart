import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Resources.color.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),

            // Name TextField
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),

            // Email TextField
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Add logic to save profile changes
                Get.snackbar('Success', 'Profile Updated!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Resources.color.hightlight,
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
