import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:youtube_clone/Core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const YouTubeClone());
}

class YouTubeClone extends StatelessWidget {
  const YouTubeClone({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
