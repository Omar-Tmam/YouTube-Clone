import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ChannelNameAndPhoto extends StatelessWidget {
  const ChannelNameAndPhoto({
    super.key,
    required this.widget,
  });

  final VideoPlayerWidget widget;

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
              widget.videoDetailModel.channel?.avatar?[0].url ?? '',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            fit: FlexFit.loose,
            child: CustomText(
              fontSize: AppStyles.styleRegular14(context).fontSize,
              fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
              title: widget.videoDetailModel.channel?.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
