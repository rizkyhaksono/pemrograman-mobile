import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        width: width / 2,
        decoration: ShapeDecoration(
          color: Resources.color.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageName,
              width: width / 4,
            ),
          ],
        ),
      ),
    );
  }
}