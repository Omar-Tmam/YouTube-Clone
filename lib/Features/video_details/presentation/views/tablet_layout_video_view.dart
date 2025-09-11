import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/custom_video_appbar.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/tablet_video_view_body.dart';

class TabletLayoutVideoView extends StatelessWidget {
  const TabletLayoutVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomVideoAppBar(), body:TabletVideoViewBody ());
  }
}
