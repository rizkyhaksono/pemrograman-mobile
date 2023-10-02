import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';

class CardRecommend extends StatefulWidget {
  final String imagePath;
  final String categoryName;
  final bool isSelected;

  const CardRecommend({
    super.key,
    required this.imagePath,
    required this.categoryName,
    this.isSelected = false,
  });

  @override
  State<CardRecommend> createState() => _CardRecommendState();
}

class _CardRecommendState extends State<CardRecommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        decoration: ShapeDecoration(
          color: Resources.color.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Resources.font.primaryFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
