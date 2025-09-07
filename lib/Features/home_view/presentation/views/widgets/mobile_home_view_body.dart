import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/video_item.dart';

class MobileHomeViewBody extends StatelessWidget {
  const MobileHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return VideoItem();
      },
    );
  }
}
