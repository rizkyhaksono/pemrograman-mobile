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
          // color: Resources.color.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.fill,
                ),
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
