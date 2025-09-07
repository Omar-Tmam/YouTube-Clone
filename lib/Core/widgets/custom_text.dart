import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.maxLines, this.color,
  });
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}