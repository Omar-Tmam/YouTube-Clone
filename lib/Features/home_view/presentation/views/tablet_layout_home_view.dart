import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/home_view/presentation/manager/cubit/search_video_cubit.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/mobile_home_view_body.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/my_app_bar.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/tablet_home_view_body.dart';

class TabletLayoutHomeView extends StatefulWidget {
  const TabletLayoutHomeView({super.key});

  @override
  State<TabletLayoutHomeView> createState() => _TabletLayoutHomeViewState();
}

class _TabletLayoutHomeViewState extends State<TabletLayoutHomeView> {
  bool isClear = false;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        isClear = false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: MyAppBar(
              suffix: isClear
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.clear();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              onSubmitted: (value) {
                context.read<SearchVideoCubit>().getVideo(value);
              },
              onTap: () {
                setState(() {
                  isClear = true;
                });
              },
              focusNode: focusNode,
              controller: controller),
        ),
        body: TabletHomeViewBody(),
      ),
    );
  }
}
