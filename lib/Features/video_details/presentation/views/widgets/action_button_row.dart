import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/functions/format_number.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({
    super.key, required this.videoDetailModel,
  });
  final VideoDetailModel videoDetailModel;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ActionButtonModel(
        icon: Icons.thumb_up_alt_outlined,
        label: formatNumber(videoDetailModel.likeCount!),
      ),
      ActionButtonModel(icon: Icons.share_outlined, label: "Share"),
      ActionButtonModel(icon: Icons.bookmark_border, label: "Save"),
      ActionButtonModel(icon: Icons.download_outlined, label: "Download"),
      ActionButtonModel(icon: Icons.favorite_border, label: "Thanks"),
      ActionButtonModel(icon: Icons.content_cut, label: "Clip"),
      ActionButtonModel(icon: Icons.flag_outlined, label: "Report"),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttons.map((btn) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(btn.icon, color: Colors.white, size: 20),
              label: Text(btn.label, style: AppStyles.styleRegular14(context)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
