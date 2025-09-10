import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ChannelSubsAndSub extends StatelessWidget {
  const ChannelSubsAndSub({
    super.key, required this.videoDetailModel,
  });

  final VideoDetailModel videoDetailModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: CustomText(
              fontSize: AppStyles.styleRegular14(context).fontSize,
              fontWeight: AppStyles.styleRegular14(context).fontWeight,
              title: '${videoDetailModel.channel?.subscriberCountText}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              elevation: 0,
            ),
            child: CustomText(
              fontSize: AppStyles.styleRegular14(context).fontSize,
              fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
              title: 'Subscribe',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
