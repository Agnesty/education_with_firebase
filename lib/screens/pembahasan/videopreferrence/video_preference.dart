import 'package:chewie/chewie.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLandscapePreference extends StatefulWidget {
  const VideoLandscapePreference({super.key, required this.model});
  static String routeName = "/videolandscapepreference";
  final Materi model;

  @override
  State<VideoLandscapePreference> createState() =>
      _VideoLandscapePreferenceState(model: model);
}

class _VideoLandscapePreferenceState extends State<VideoLandscapePreference> {
  final Materi model;
 _VideoLandscapePreferenceState({
    required this.model,
  });

  ChewieController? chewieController;
 VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initPlayer();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _initPlayer();
    // });
  }

  void _initPlayer() async {
    _controller = VideoPlayerController.network(
      model.urlVideo,
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      autoPlay: false,
      looping: false,
      videoPlayerController: _controller! ,
    );

    return Center(
      child: _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Chewie(
                controller: chewieController,
              ),
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
