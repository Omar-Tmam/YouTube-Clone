import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_detail_repo_implementation.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/mobile_layout_video_view.dart';

class VideoDetailView extends StatelessWidget {
  const VideoDetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoDetailsCubit(VideoDetailRepoImplementation(apiService: ApiService()))..getVideoDetail(id),
      child: CustomAdaptiveLayout(
          mobileLayout: (context) => MobileLayoutVideoView(

              ),
          tabletLayout: (context) => SizedBox()),
    );
  }
}
