import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/home_view/presentation/manager/cubit/search_video_cubit.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/video_item.dart';

class TabletHomeViewBody extends StatelessWidget {
  const TabletHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVideoCubit, SearchVideoState>(
      builder: (context, state) {
        if (state is SearchVideoLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is SearchVideoSuccess) {
          return GridView.builder(
            itemCount: state.searchModel.items?.length ?? 0,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  MediaQuery.sizeOf(context).width < 805 ? 300 : 400,
            ),
            itemBuilder: (context, index) {
              return VideoItem(
                index: index,
                searchModel: state.searchModel,
              );
            },
          );
        } else {
          return const Center(child: Text('failure'));
        }
      },
    );
  }
}
