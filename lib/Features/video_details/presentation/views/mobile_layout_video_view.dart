import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/mobile_video_view_body.dart';

class MobileLayoutVideoView extends StatelessWidget {
  const MobileLayoutVideoView({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: MobileVideoViewBody(),
    );
  }
}
