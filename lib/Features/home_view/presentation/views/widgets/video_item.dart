import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/video_info.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                  'https://i.ytimg.com/vi/7D-6MYpfFmk/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLC8du8OUtV1vhf2FgF3hfrXQIdGnA'),
              Positioned(
                bottom: 5,
                right: 10,
                child: Container(
                  color: Colors.black12,
                  child: CustomText(
                    fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                    color: Colors.black,
                    fontSize: AppStyles.styleSemiBold18(context).fontSize,
                    title: '00:00',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          VideoInfo(),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
