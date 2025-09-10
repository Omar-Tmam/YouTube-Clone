import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comment_repo/comment_repo_implementation.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_repo/related_repo_implementation.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_detail_repo/video_detail_repo_implementation.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/comment_cubit/comment_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/related_cubit/related_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/video_detail_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/mobile_layout_video_view.dart';

class VideoDetailView extends StatelessWidget {
  const VideoDetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => VideoDetailsCubit(
                VideoDetailRepoImplementation(apiService: ApiService()))
              ..getVideoDetail(id)),
        BlocProvider(
            create: (context) => CommentCubit(
                CommentRepoImplementation(apiService: ApiService()))
              ..getComment(id)),
              BlocProvider(
            create: (context) => RelatedCubit(
                RelatedRepoImplementation(apiService: ApiService()))
              ..getRelated(id))
      ],
      child: CustomAdaptiveLayout(
          mobileLayout: (context) => MobileLayoutVideoView(),
          tabletLayout: (context) => SizedBox()),
    );
  }
}
