import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/size_config.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.color,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'(https?:\/\/\S+|www\.\S+|#\w+)');

    final spans = <TextSpan>[];
    int lastIndex = 0;

    for (final match in regex.allMatches(title)) {
      // النص العادي قبل الهاشتاج/اللينك
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: title.substring(lastIndex, match.start),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? Colors.white,
          ),
        ));
      }

      // النص اللي هو هاشتاج أو لينك
      final matchedText = match.group(0)!;
      spans.add(
        TextSpan(
          text: matchedText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.blue,
            decoration: TextDecoration.underline, // يخليها شبه hyperlink
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              debugPrint("Tapped: $matchedText");
              // هنا تقدر تفتح اللينك أو تعمل بحث بالهاشتاج
            },
        ),
      );

      lastIndex = match.end;
    }

    // باقي النص بعد آخر match
    if (lastIndex < title.length) {
      spans.add(TextSpan(
        text: title.substring(lastIndex),
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.white,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: true,
    );
  }
}

