import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_clone/Core/functions/format_number.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/comment_cubit/comment_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_section.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_item.dart';
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

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Video(controller: controller),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: VideoInfoSection(
                    widget: widget,
                    videoDetailModel: widget.videoDetailModel,
                  ),
                ),
                SliverToBoxAdapter(child: ActionButtonsRow(buttons: buttons)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<CommentCubit, CommentState>(
                    builder: (context, state) {
                      if (state is CommentSucess) {
                        return CommentsSection(
                          commentModel: state.commentModel,
                        );
                      } else if (state is CommentLoading) {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      } else {
                        return Text('failure');
                      }
                    },
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: 5,
                  (context, index) {
                    return RelatedVideoItem();
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
