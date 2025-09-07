import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/home_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/video_detail_view.dart';

abstract class AppRouter {
  static const kHomeView = '/';
  static const kVideoDetailView = 'videoDetailView';
  static final router = GoRouter(routes: 
[

  GoRoute(path: kHomeView,
  builder: (context, state) => HomeView(),),
    GoRoute(path: kVideoDetailView,
  builder: (context, state) => VideoDetailView(),),

]);
}

