import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/mobile_home_view_body.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/my_app_bar.dart';

class MobileLayoutHomeView extends StatefulWidget {
  const MobileLayoutHomeView({super.key});

  @override
  State<MobileLayoutHomeView> createState() => _MobileLayoutHomeViewState();
}

class _MobileLayoutHomeViewState extends State<MobileLayoutHomeView> {
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
      },
      child: Scaffold(
        appBar: AppBar(
          title: MyAppBar(
              onSubmitted: (value) {},
              onTap: () {},
              focusNode: focusNode,
              controller: controller),
        ),
        body: MobileHomeViewBody(),
      ),
    );
  }
}
