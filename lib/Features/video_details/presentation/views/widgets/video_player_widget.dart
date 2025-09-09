import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_info_section.dart';

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
  final List<ActionButtonModel> buttons = [
    ActionButtonModel(icon: Icons.thumb_up_alt_outlined, label: "3.1K"),
    ActionButtonModel(icon: Icons.share_outlined, label: "Share"),
    ActionButtonModel(icon: Icons.bookmark_border, label: "Save"),
    ActionButtonModel(icon: Icons.download_outlined, label: "Download"),
  ];

  // 2. Create a [VideoController] instance and associate it with the player.
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    // 3. Open the media source.
    // The `play: true` argument will start playback immediately,
    // which matches the behavior of your original video_player code.
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
    // 5. Use the Video widget to display the video output.
    // I've kept your original Expanded widget.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Video(controller: controller),
        ),
        VideoInfoSection(widget: widget),
        ActionButtonsRow(buttons: buttons)
      ],
    );
  }
}
