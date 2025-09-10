import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                fontSize: AppStyles.styleSemiBold18(context).fontSize,
                title: 'Comments',
              ),
              SizedBox(
                width: 6,
              ),
              CustomText(
                color: Colors.grey,
                title: '100',
                fontSize: AppStyles.styleRegular14(context).fontSize,
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                  shadowColor: WidgetStateProperty.all(Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    'https://yt3.ggpht.com/Bg5wS82KGryRmcsn1YbPThtbXoTmj2XJ9_7LmuE2RF6wbKJBkovfRypbSz6UD3gEu_nHiwGZtQ=s88-c-k-c0x00ffffff-no-rj'),
              ),
              SizedBox(
                width: 8,
              ),
              CustomText(
                title: 'can confirm: he never gave us up',
                fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
                fontSize: AppStyles.styleRegular14(context).fontSize,
              )
            ],
          )
        ],
      ),
    );
  }
}
