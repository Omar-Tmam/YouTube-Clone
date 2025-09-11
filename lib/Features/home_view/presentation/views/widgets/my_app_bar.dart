import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/cubits/theme_cubit/theme_cubit.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      this.focusNode,
      this.controller,
      this.onTap,
      this.onSubmitted,
      this.suffix});

  final TextEditingController? controller;
  final Function()? onTap;
  final Function(dynamic)? onSubmitted;
  final FocusNode? focusNode;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
          width: MediaQuery.of(context).size.width * 0.10, // 8% من عرض الشاشة
          height: 40,
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
        IconButton(
            color: Colors.white,
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(Theme.of(context).brightness == Brightness.dark
                ? Icons.light_mode
                : Icons.dark_mode))
      ],
    );
  }
}
