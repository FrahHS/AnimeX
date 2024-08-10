import 'package:animex/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlButtons extends StatefulWidget {
  const VideoControlButtons({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VideoControlButtons> createState() => _VideoControlButtonsState();
}

class _VideoControlButtonsState extends State<VideoControlButtons> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds - 1));
            });
          },
          icon: const Icon(Icons.fast_rewind, size: 40,),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (widget.controller.value.isPlaying) {
                  widget.controller.pause();
                } else {
                  widget.controller.play();
                }
              });
            },
            icon: Icon(widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 60,),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds + 1));
            });
          },
          icon: const Icon(Icons.fast_forward, size: 40,),
        ),
      ],
    );
  }
}
