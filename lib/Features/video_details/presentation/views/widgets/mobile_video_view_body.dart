import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class MobileVideoViewBody extends StatefulWidget {
  const MobileVideoViewBody({super.key, required this.id, required this.url});
  final String id;
  final String url;

  @override
  State<MobileVideoViewBody> createState() => _MobileVideoViewBodyState();
}

class _MobileVideoViewBodyState extends State<MobileVideoViewBody> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((v) {
        setState(() {
          controller.play();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [VideoPlayer(controller)],
    );
  }
}
