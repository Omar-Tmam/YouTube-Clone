import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/size_config.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.color,
    this.overflow,
  });

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize != null
            ? getResponsiveFontSize(context, fontSize: fontSize!)
            : null,
        color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}

// Helper function for responsive font sizing
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return width / 450;
  } else {
    return width / 800;
  }
}
