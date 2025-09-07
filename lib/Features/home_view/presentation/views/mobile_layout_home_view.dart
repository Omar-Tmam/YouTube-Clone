import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/mobile_home_view_body.dart';

class MobileLayoutHomeView extends StatelessWidget {
  const MobileLayoutHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
              width: 60,
            ),
            
          ],
        ),
      ),
      body: MobileHomeViewBody(),
    );
  }
}
