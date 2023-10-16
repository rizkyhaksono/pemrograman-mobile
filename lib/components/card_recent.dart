import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRecent extends StatefulWidget {
  final String recentName;
  final String imageName;

  const CardRecent({
    super.key,
    required this.recentName,
    required this.imageName,
  });

  @override
  State<CardRecent> createState() => _CardRecentState();
}

class _CardRecentState extends State<CardRecent> {
  dynamic orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    orientation = MediaQuery.of(context).orientation;

    // size of the screen
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: Container(
        width: width / 2,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.imageName,
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              widget.recentName,
              style: TextStyle(
                color: Colors.white,
                fontFamily: Resources.font.primaryFont,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
