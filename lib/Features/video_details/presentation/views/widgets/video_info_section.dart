import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_sub_system.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/views_date_sction.dart';

class VideoInfoSection extends StatelessWidget {
  const VideoInfoSection({
    super.key,
    required this.widget, required this.videoDetailModel,
  });

  final VideoPlayerWidget widget;
  final VideoDetailModel videoDetailModel;

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
        ViewsAndDateSection(widget: widget,videoDetailModel:videoDetailModel ,),
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
