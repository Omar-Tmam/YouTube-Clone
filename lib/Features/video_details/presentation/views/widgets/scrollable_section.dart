import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Core/utils/app_router.dart';

import 'package:youtube_clone/Features/video_details/data/models/video_detail_model/video_detail_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/comment_cubit/comment_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/related_cubit/related_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_section.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_item.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_info_section.dart';


class ScrollableSection extends StatelessWidget {
  const ScrollableSection({
    super.key, required this.videoDetailModel,
  });

  final VideoDetailModel videoDetailModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: VideoInfoSection(
            videoDetailModel: videoDetailModel,
          ),
        ),
        SliverToBoxAdapter(
            child: ActionButtonsRow(
          videoDetailModel: videoDetailModel,
        )),
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
        BlocBuilder<RelatedCubit, RelatedState>(
          builder: (context, state) {
            if (state is RelatedSuccess) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: state.relatedModel.items?.length,
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushReplacement(AppRouter.kVideoDetailView,
                          extra: state.relatedModel.items?[index].id);
                    },
                    child: RelatedVideoItem(
                      relatedModel: state.relatedModel,
                      index: index,
                    ),
                  );
                },
              ));
            } else if (state is RelatedLoading) {
              return SliverToBoxAdapter(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Text('data'),
              );
            }
          },
        )
      ],
    );
  }
}
