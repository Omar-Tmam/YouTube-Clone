import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_info_likes_views.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  const ModalBottomSheetWidget({
    super.key, required this.videoModel,
  });
  final VideoDetailModel videoModel;
  Future<void> _onOpen(LinkableElement link) async {
    final uri = Uri.parse(link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: AppStyles.styleSemiBold18(context)),
          Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(videoModel?.title ?? "",
                      style: AppStyles.styleSemiBold18(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VideoDetailsInfoLikesViews(
                        count: videoModel?.likeCount
                                .toString() ??
                            "0",
                        title: 'Likes',
                      ),
                      VideoDetailsInfoLikesViews(
                        count: videoModel?.viewCount
                                .toString() ??
                            "0",
                        title: 'Views',
                      ),
                      VideoDetailsInfoLikesViews(
                          count:
                              videoModel?.publishedTimeText ??
                                  "0"),
                    ],
                  ),
                  Linkify(
                    onOpen: _onOpen,
                    text: videoModel?.description ?? "",
                    style: AppStyles.styleRegular14(context),
                    linkStyle: AppStyles.styleRegular14(context)
                        .copyWith(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
