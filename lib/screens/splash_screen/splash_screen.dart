import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/video.mp4")
      ..setVolume(0.0)
      ..play();
    controller.addListener(() {
      if (!controller.value.isPlaying) {
        Navigate.replaceNamed(Routes.login);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose(); // when app is been closed destroyed the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          builder: (_, snapshot) {
            return AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            );
          },
          future: controller.initialize(),
        ),
      ),
    );
  }
}
