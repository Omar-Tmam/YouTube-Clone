import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/mobile_layout_video_view.dart';

class VideoDetailView extends StatelessWidget {
  const VideoDetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectBloc(),
      child: CustomAdaptiveLayout(
          mobileLayout: (context) => MobileLayoutVideoView(
                id: id,
              ),
          tabletLayout: (context) => SizedBox()),
    );
  }
}
