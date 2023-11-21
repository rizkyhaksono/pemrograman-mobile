import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget notifSheet(BuildContext context) {
  return Container(
    width: Get.width,
    color: Resources.color.background,
    height: Get.height,
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 10,
    ),
    child: ListView(
      children: [
        Column(
          children: [
            Text(
              "Notification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Resources.color.hightlight,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ],
    ),
  );
}
