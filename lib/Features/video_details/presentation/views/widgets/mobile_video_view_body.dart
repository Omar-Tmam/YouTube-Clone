import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/presentation/manager/cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class MobileVideoViewBody extends StatelessWidget {
  const MobileVideoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
      builder: (context, state) {
        if (state is VideoDetailsLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else if (state is VideoDetailsSuccess) {
          return Column(
            children: [
              VideoPlayerWidget(
                videoDetailModel: state.videoDetailModel,
                  url: state.videoDetailModel.videos?.items?[0].url ?? '')
            ],
          );
        } else {
          return Text('error');
        }
      },
    );
  }
}



