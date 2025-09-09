import 'package:flutter/widgets.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ViewsAndDateSection extends StatelessWidget {
  const ViewsAndDateSection({
    super.key,
    required this.widget,
  });

  final VideoPlayerWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          title: '${widget.videoDetailModel.viewCount} Views',
          fontSize: AppStyles.styleRegular14(context).fontSize,
        ),
        CustomText(
          title: ' • ${widget.videoDetailModel.publishedTimeText} ',
          fontSize: AppStyles.styleRegular14(context).fontSize,
        )
      ],
    );
  }
}