import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_name_photo.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_sub_subs.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ChannelAndSubscribeSection extends StatelessWidget {
  const ChannelAndSubscribeSection({
    super.key,
    required this.widget,
  });

  final VideoPlayerWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChannelNameAndPhoto(widget: widget),
        const SizedBox(width: 10),
        ChannelSubsAndSub(widget: widget),
      ],
    );
  }
}
