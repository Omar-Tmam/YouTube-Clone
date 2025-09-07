import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
            'https://i.ytimg.com/vi/7D-6MYpfFmk/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLC8du8OUtV1vhf2FgF3hfrXQIdGnA'),
        SizedBox(
          height: 10,
        ),
        Row(
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
              children: [
                CustomText(title: 'Takkat Chess'),
                CustomText(title: '400k views')
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
