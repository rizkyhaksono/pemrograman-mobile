import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';

class CardRecent extends StatefulWidget {
  final String recentName;

  const CardRecent({
    super.key,
    required this.recentName,
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
      padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
      child: Container(
        width: width / 2,
        decoration: ShapeDecoration(
          color: Resources.color.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.recentName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
