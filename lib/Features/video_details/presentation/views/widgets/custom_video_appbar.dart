import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class CustomVideoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const CustomVideoAppBar({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 28,
        ),
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      ),
      centerTitle: true, // 👈 يخلي العنوان في النص الحقيقي
      title: Row(
        mainAxisSize: MainAxisSize.min, // 👈 الصف ياخد عرض النص + الصورة بس
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
            height: 24,
          ),
          const SizedBox(width: 6),
          CustomText(
            title: "YouTube",
            fontSize: AppStyles.styleSemiBold22(context).fontSize,
            fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}