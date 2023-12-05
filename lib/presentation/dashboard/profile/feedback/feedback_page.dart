import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart'; // Import your FeedbackController file


class FeedbackPage extends StatelessWidget {
  final FeedbackController controller = Get.put(FeedbackController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Feedback Form',
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 32,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controller.titleController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 175, 162, 135),
                      fontSize: 15,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 134, 128, 115),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.descController,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Resources.color.hightlight,
                    fontSize: 13,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 175, 162, 135),
                      fontSize: 15,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 134, 128, 115),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Resources.color.hightlight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.storeFeedback();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Resources.color.hightlight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text("Submit",
                      style: TextStyle(
                          color: Resources.color.background,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
