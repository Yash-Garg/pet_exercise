import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petperfect_exercise/ui/home/cubit/home_cubit.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoURL});
  final String videoURL;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoURL)
      ..initialize().then((_) {
        context.read<HomeCubit>().processed();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller..play()),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
