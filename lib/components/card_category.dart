import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatefulWidget {
  final String categoryName;
  final bool isSelected;

  const CardCategory({
    super.key,
    required this.categoryName,
    this.isSelected = false,
  });

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: widget.isSelected ? 1.0 : 0.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
        child: Container(
          width: 130,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.68, -0.74),
              end: const Alignment(-0.68, 0.74),
              colors: widget.isSelected
                  ? [Resources.color.gradient, Resources.color.gradient]
                  : [const Color(0xFF222232), const Color(0xFF222232)],
            ),
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
                  widget.categoryName,
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
      ),
    );
  }
}
