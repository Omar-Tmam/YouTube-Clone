import 'package:flutter/material.dart';
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
              CustomText(title: searchModel.items?[index].title ?? ''),
              CustomText(title: searchModel.items?[index].channel?.name ?? ''),
              Row(
                children: [
                  CustomText(
                      title: searchModel.items?[index].viewCountText ?? ''),
                  CustomText(
                      title:
                          ' •  ${searchModel.items?[index].publishedTimeText ?? ''}'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
