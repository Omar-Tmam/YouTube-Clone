import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/home_view/data/repos/search_repo_implementation.dart';
import 'package:youtube_clone/Features/home_view/presentation/manager/cubit/search_video_cubit.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/mobile_layout_home_view.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/tablet_layout_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchVideoCubit(SearchRepoImplementation(apiService: ApiService()))
            ..getVideo('flutter'),
      child: CustomAdaptiveLayout(
        mobileLayout: (context) => MobileLayoutHomeView(),
        tabletLayout: (context) => TabletLayoutHomeView(),
      ),
    );
  }
}
