import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:youtube_clone/Core/cubits/theme_cubit/theme_cubit.dart';
import 'package:youtube_clone/Core/utils/app_router.dart';
import 'package:youtube_clone/Core/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const YouTubeClone(),
    ),
  );
}

class YouTubeClone extends StatelessWidget {
  const YouTubeClone({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              darkTheme: AppTheme.darkMode,
              themeMode: state,
              theme: AppTheme.lightMode);
        },
      ),
    );
  }
}
