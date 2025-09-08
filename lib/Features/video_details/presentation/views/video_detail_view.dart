import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/mobile_layout_video_view.dart';

class VideoDetailView extends StatelessWidget {
  const VideoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAdaptiveLayout(
        mobileLayout: (context) => MobileLayoutVideoView(),
        tabletLayout: (context) => SizedBox());
  }
}
