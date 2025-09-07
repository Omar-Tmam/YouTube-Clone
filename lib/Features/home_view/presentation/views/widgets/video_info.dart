import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://yt3.ggpht.com/-B-rvdIH8cZ3vh7vVlTw9nT6h0RYNU2__RsDAMeB_emc_XtnPZiaIRUKH2Gti75u50qXGuNoIAE=s68-c-k-c0x00ffffff-no-rj'),
          radius: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: 'Video Name'),
            CustomText(title: 'channel name,watched by,days ago')
          ],
        )
      ],
    );
  }
}