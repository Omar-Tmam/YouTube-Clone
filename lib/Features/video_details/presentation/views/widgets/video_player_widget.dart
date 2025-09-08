import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerWidget extends StatefulWidget {
  /// The network URL of the video to play.
  final String url;

  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  // 1. Create a [Player] instance from media_kit.
  late final player = Player();

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
    return Expanded(
      child: Video(controller: controller),
    );
  }
}