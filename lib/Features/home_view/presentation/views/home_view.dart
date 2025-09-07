import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/mobile_layout_home_view.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/tablet_layout_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAdaptiveLayout(
      mobileLayout: (context) => MobileLayoutHomeView(),
      tabletLayout: (context) =>  TabletLayoutHomeView(),
    );
  }
}