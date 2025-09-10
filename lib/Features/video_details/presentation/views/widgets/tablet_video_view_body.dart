import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Core/utils/app_router.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/comment_cubit/comment_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/related_cubit/related_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/video_detail_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_section.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_item.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/tablet_video_player.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_info_section.dart';

class TabletVideoViewBody extends StatelessWidget {
  const TabletVideoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
      builder: (context, state) {
        if (state is VideoDetailsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is VideoDetailsSuccess) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// الجزء الشمال (الفيديو + info + كومنتات)
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TabletVideoPlayerWidget(
                        videoDetailModel: state.videoDetailModel,
                        url: state.videoDetailModel.videos?.items?[0].url ?? '',
                      ),
                      const SizedBox(height: 8),
                      VideoInfoSection(
                          videoDetailModel: state.videoDetailModel),
                      ActionButtonsRow(
                          videoDetailModel: state.videoDetailModel),
                      const SizedBox(height: 8),
                      BlocBuilder<CommentCubit, CommentState>(
                        builder: (context, commentState) {
                          if (commentState is CommentSucess) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: CommentsSection(
                                commentModel: commentState.commentModel,
                              ),
                            );
                          } else if (commentState is CommentLoading) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          } else {
                            return const Text('failure');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /// الجزء اليمين (الفيديوهات الـ related)
              Expanded(
                flex: 1,
                child: BlocBuilder<RelatedCubit, RelatedState>(
                  builder: (context, relatedState) {
                    if (relatedState is RelatedSuccess) {
                      return ListView.builder(
                        itemCount: relatedState.relatedModel.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.pushReplacement(
                                AppRouter.kVideoDetailView,
                                extra:
                                    relatedState.relatedModel.items?[index].id,
                              );
                            },
                            child: RelatedVideoItem(
                              relatedModel: relatedState.relatedModel,
                              index: index,
                            ),
                          );
                        },
                      );
                    } else if (relatedState is RelatedLoading) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      return const Text('error loading related videos');
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return const Text('error');
        }
      },
    );
  }
}
