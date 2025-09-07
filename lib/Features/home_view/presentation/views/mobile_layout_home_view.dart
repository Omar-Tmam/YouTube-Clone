import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/mobile_home_view_body.dart';

class MobileLayoutHomeView extends StatelessWidget {
  const MobileLayoutHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:MobileHomeViewBody() ,
    );
  }
}