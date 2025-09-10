import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_clone/Core/functions/format_number.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_info_section.dart';

class VideoPlayerWidget extends StatefulWidget {
  /// The network URL of the video to play.
  final String url;
  final VideoDetailModel videoDetailModel;

  const VideoPlayerWidget(
      {super.key, required this.url, required this.videoDetailModel});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  // 1. Create a [Player] instance from media_kit.
  late final player = Player();
  bool isDescreption = false;
  late List<ActionButtonModel> buttons;
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.url), play: true);
  }

  @override
  void dispose() {
    // 4. Dispose the player to release resources.
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ActionButtonModel(
        icon: Icons.thumb_up_alt_outlined,
        label: formatNumber(widget.videoDetailModel.likeCount!),
      ),
      ActionButtonModel(icon: Icons.share_outlined, label: "Share"),
      ActionButtonModel(icon: Icons.bookmark_border, label: "Save"),
      ActionButtonModel(icon: Icons.download_outlined, label: "Download"),
      ActionButtonModel(icon: Icons.favorite_border, label: "Thanks"),
      ActionButtonModel(icon: Icons.content_cut, label: "Clip"),
      ActionButtonModel(icon: Icons.flag_outlined, label: "Report"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Video(controller: controller),
        ),
        VideoInfoSection(
          widget: widget,
          videoDetailModel: widget.videoDetailModel,
        ),
        ActionButtonsRow(buttons: buttons),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                    fontSize: AppStyles.styleSemiBold18(context).fontSize,
                    title: 'Comments',
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  CustomText(
                    color: Colors.grey,
                    title: '100',
                    fontSize: AppStyles.styleRegular14(context).fontSize,
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.grey[900]),
                      shadowColor: WidgetStateProperty.all(Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/Bg5wS82KGryRmcsn1YbPThtbXoTmj2XJ9_7LmuE2RF6wbKJBkovfRypbSz6UD3gEu_nHiwGZtQ=s88-c-k-c0x00ffffff-no-rj'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    title: 'can confirm: he never gave us up',
                    fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
                    fontSize: AppStyles.styleRegular14(context).fontSize,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
