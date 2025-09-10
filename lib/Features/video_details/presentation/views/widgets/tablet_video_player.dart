import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';

class TabletVideoPlayerWidget extends StatefulWidget {
  /// The network URL of the video to play.
  final String url;
  final VideoDetailModel videoDetailModel;

  const TabletVideoPlayerWidget(
      {super.key, required this.url, required this.videoDetailModel});

  @override
  State<TabletVideoPlayerWidget> createState() =>
      _TabletVideoPlayerWidgetState();
}

class _TabletVideoPlayerWidgetState extends State<TabletVideoPlayerWidget> {
  // 1. Create a [Player] instance from media_kit.
  late final player = Player();
  bool isDescreption = false;
  late List<ActionButtonModel> buttons;
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.url), play: true);
  }

  @override
  void dispose() {
    // 4. Dispose the player to release resources.
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Video(controller: controller),
    );
  }
}

