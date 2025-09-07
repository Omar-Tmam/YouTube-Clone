import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      required this.focusNode,
      required this.controller,
      required this.onTap,
      required this.onSubmitted, required this.suffix});

  final TextEditingController controller;
  final Function()? onTap;
  final Function(dynamic)? onSubmitted;
  final FocusNode? focusNode;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
          width: 60,
        ),
        SizedBox(
          width: 10,
        ),
        CustomText(
          title: 'YouTube',
          fontSize: AppStyles.styleSemiBold22(context).fontSize,
          fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CupertinoTextField(
            focusNode: focusNode,
            onTap: onTap,
            onSubmitted: onSubmitted,
            suffix: suffix,
            placeholderStyle:
                AppStyles.styleRegular16(context).copyWith(color: Colors.black),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                CupertinoIcons.search,
                color: Colors.black,
                size: 20,
              ),
            ),
            style: AppStyles.styleRegular16(context).copyWith(
              color: Colors.black,
            ),
            controller: controller,
            placeholder: 'Search...',
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
