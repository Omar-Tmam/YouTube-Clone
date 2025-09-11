import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';

class ChannelNameAndPhoto extends StatelessWidget {
  const ChannelNameAndPhoto({
    super.key,
    required this.videoDetailModel,
  });

  final VideoDetailModel videoDetailModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              videoDetailModel.channel?.avatar?[0].url ?? '',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            fit: FlexFit.loose,
            child: CustomText(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: AppStyles.styleRegular14(context).fontSize,
              fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
              title: videoDetailModel.channel?.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
