import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/home_view/presentation/manager/cubit/search_video_cubit.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/mobile_home_view_body.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/my_app_bar.dart';

class MobileLayoutHomeView extends StatefulWidget {
  const MobileLayoutHomeView({super.key});

  @override
  State<MobileLayoutHomeView> createState() => _MobileLayoutHomeViewState();
}

class _MobileLayoutHomeViewState extends State<MobileLayoutHomeView> {
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
        body: MobileHomeViewBody(),
      ),
    );
  }
}
