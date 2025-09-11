import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_name_photo.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_sub_subs.dart';

class ChannelAndSubscribeSection extends StatelessWidget {
  const ChannelAndSubscribeSection({
    super.key, required this.videoDetailModel,
  });

  final VideoDetailModel videoDetailModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChannelNameAndPhoto(videoDetailModel: videoDetailModel,),
        const SizedBox(width: 10),
        ChannelSubsAndSub(videoDetailModel: videoDetailModel,),
      ],
    );
  }
}
