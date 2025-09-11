import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({
    super.key,
    required this.searchModel,
    required this.index,
  });
  final SearchModel searchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              searchModel.items?[index].channel?.avatar?[0].url ?? ''),
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
                color: Theme.of(context).textTheme.bodyLarge?.color,
                // maxLines: 3,
                title: searchModel.items?[index].title ?? '',
                fontSize: AppStyles.styleRegular14(context).fontSize,
              ),
              SizedBox(
                height: 6,
              ),
              CustomText(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  title: searchModel.items?[index].channel?.name ?? ''),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomText(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        maxLines: 3,
                        title: searchModel.items?[index].viewCountText ?? '',
                        fontSize: AppStyles.styleRegular14(context).fontSize),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomText(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        maxLines: 2,
                        title:
                            ' •  ${searchModel.items?[index].publishedTimeText ?? ''}',
                        fontSize: AppStyles.styleRegular14(context).fontSize),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
