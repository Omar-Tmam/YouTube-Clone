import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_sub_system.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/views_date_sction.dart';

class VideoInfoSection extends StatelessWidget {
  const VideoInfoSection({
    super.key,
    required this.widget,
  });

  final VideoPlayerWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(
          title: widget.videoDetailModel.title ?? '',
          fontSize: AppStyles.styleRegular14(context).fontSize,
          fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
        ),
        SizedBox(
          height: 10,
        ),
        ChannelAndSubscribeSection(widget: widget),
        SizedBox(
          height: 10,
        ),
        ViewsAndDateSection(widget: widget),
        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       isDescreption = !isDescreption;
        //     });
        //   },
        //   child: CustomText(
        //     title: widget.videoDetailModel.description ?? '',
        //     overflow: TextOverflow.ellipsis,
        //     maxLines: isDescreption ? 10 : 2,
        //   ),
        // ),],
      ]),
    );
  }
}
