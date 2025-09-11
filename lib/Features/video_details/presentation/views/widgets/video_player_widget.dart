import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/scrollable_section.dart';

class VideoPlayerWidget extends StatefulWidget {
  /// The network URL of the video to play.
  final String url;
  final VideoDetailModel videoDetailModel;

  const VideoPlayerWidget(
      {super.key, required this.url, required this.videoDetailModel});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  // 1. Create a [Player] instance from media_kit.
  late final player = Player();
  bool isDescreption = false;

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
    

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Video(controller: controller),
          ),
          Expanded(
            child: ScrollableSection(videoDetailModel: widget.videoDetailModel,),
          )
        ],
      ),
    );
  }
}
