import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/comment_model/comment_model.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
    required this.commentModel,
  });
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                fontSize: AppStyles.styleSemiBold18(context).fontSize,
                title: 'Comments',
              ),
              SizedBox(
                width: 6,
              ),
              CustomText(
                color: Theme.of(context).textTheme.bodySmall?.color,
                title: commentModel.countText ?? '',
                fontSize: AppStyles.styleRegular14(context).fontSize,
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                style: ButtonStyle(
                    // backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                    // shadowColor: WidgetStateProperty.all(Colors.white),
                    ),
              )
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    commentModel.items?[1].channel?.avatar?[0].url ?? ''),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomText(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  maxLines: 3,
                  title: commentModel.items?[1].contentText ?? '',
                  fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
                  fontSize: AppStyles.styleRegular14(context).fontSize,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
