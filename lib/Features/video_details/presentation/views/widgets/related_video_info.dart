import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';

class RelatedVideoInfo extends StatelessWidget {
  const RelatedVideoInfo({
    super.key,
    required this.relatedModel,
    required this.index,
  });
  final RelatedModel relatedModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              relatedModel.items?[index].channel?.avatar?[0].url ?? ''),
          radius: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: relatedModel.items?[index].title ?? '',
                fontSize: AppStyles.styleRegular14(context).fontSize,
              ),
              SizedBox(
                height: 6,
              ),
              CustomText(
                title: relatedModel.items?[index].channel?.name ?? '',
                fontSize: AppStyles.styleRegular14(context).fontSize,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  CustomText(
                      title: relatedModel.items?[index].viewCountText ?? '',
                      fontSize: AppStyles.styleRegular14(context).fontSize),
                  CustomText(
                      title:
                          ' •  ${relatedModel.items?[index].publishedTimeText ?? ''}',
                      fontSize: AppStyles.styleRegular14(context).fontSize),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
