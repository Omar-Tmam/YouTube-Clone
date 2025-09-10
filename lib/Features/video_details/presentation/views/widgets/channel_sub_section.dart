import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ChannelAndSubscribeSection extends StatelessWidget {
  const ChannelAndSubscribeSection({
    super.key,
    required this.widget,
  });

  final VideoPlayerWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
              widget.videoDetailModel.channel?.avatar?[0].url ?? ''),
        ),
        SizedBox(
          width: 10,
        ),
        CustomText(
          fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
          title: widget.videoDetailModel.channel?.name ?? '',
          fontSize: AppStyles.styleRegular14(context).fontSize,
        ),
        SizedBox(
          width: 10,
        ),
        CustomText(
          title: '${widget.videoDetailModel.channel?.subscriberCountText}',
          fontSize: AppStyles.styleRegular14(context).fontSize,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: SizedBox()),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            elevation: 0,
          ),
          child: CustomText(
            fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
            fontSize: AppStyles.styleRegular14(context).fontSize,
            title: 'Subscribe',
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
