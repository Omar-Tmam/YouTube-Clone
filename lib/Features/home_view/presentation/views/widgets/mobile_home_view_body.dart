import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/home_view/presentation/manager/cubit/search_video_cubit.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/video_item.dart';

class MobileHomeViewBody extends StatelessWidget {
  const MobileHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVideoCubit, SearchVideoState>(
      builder: (context, state) {
        if (state is SearchVideoLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else if (state is SearchVideoSuccess) {
          return ListView.builder(
            itemCount: state.searchModel.items?.length,
            itemBuilder: (context, index) {
              return VideoItem(
                index: index,
                searchModel: state.searchModel,
              );
            },
          );
        } else {
          return Text('failure');
        }
      },
    );
  }
}
