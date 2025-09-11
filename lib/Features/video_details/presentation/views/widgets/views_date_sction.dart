import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/modal_bottom_sheet_widget.dart';


class ViewsAndDateSection extends StatelessWidget {
  const ViewsAndDateSection({
    super.key,
    required this.videoDetailModel,
  });

  final VideoDetailModel videoDetailModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ModalBottomSheetWidget(videoModel: videoDetailModel);
          },
        );
      },
      child: Row(
        children: [
          CustomText(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            title: '${videoDetailModel.viewCount} Views',
            fontSize: AppStyles.styleRegular14(context).fontSize,
          ),
          CustomText(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            title: ' • ${videoDetailModel.publishedTimeText} ',
            fontSize: AppStyles.styleRegular14(context).fontSize,
          ),
          CustomText(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            title: '....',
            fontSize: AppStyles.styleSemiBold18(context).fontSize,
            fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
          )
        ],
      ),
    );
  }
}
