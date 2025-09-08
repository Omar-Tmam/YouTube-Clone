import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MobileVideoViewBody extends StatefulWidget {
  const MobileVideoViewBody({super.key});

  @override
  State<MobileVideoViewBody> createState() => _MobileVideoViewBodyState();
}

class _MobileVideoViewBodyState extends State<MobileVideoViewBody> {
  late final player = Player();
  late final controller = VideoController(player);
  @override
  void initState() {
    player.open(Media(
        'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
    super.initState();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
