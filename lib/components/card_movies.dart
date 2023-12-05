import 'package:flutter/material.dart';

class CardRecommend extends StatefulWidget {
  final Iterable<String> imagePath;
  final Iterable<String> categoryName;
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
