import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/comment_cubit/comment_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubits/related_cubit/related_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_row.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_section.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_item.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_info_section.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class ScrollableSection extends StatelessWidget {
  const ScrollableSection({
    super.key,
    required this.widget,
    required this.buttons,
  });

  final VideoPlayerWidget widget;
  final List<ActionButtonModel> buttons;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        BlocBuilder<RelatedCubit, RelatedState>(
          builder: (context, state) {
            if (state is RelatedSuccess) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: state.relatedModel.items?.length,
                (context, index) {
                  return RelatedVideoItem(
                    relatedModel: state.relatedModel,
                    index: index,
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
