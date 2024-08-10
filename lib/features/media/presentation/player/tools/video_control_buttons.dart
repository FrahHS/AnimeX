import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlButtons extends StatefulWidget {
  const VideoControlButtons({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VideoControlButtons> createState() => _VideoControlButtonsState();
}

class _VideoControlButtonsState extends State<VideoControlButtons> {
  late bool _isPlaying;

  @override
  void initState() {
    _isPlaying = widget.controller.value.isPlaying;
    widget.controller.addListener(checkVideo);
    super.initState();
  }

  void checkVideo() {
    setState(() {
      if(widget.controller.value.isCompleted) {
        _isPlaying = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds - 10));
            });
          },
          icon: const Icon(Icons.fast_rewind, size: 40,),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (widget.controller.value.isPlaying) {
                  _isPlaying = false;
                  widget.controller.pause();
                } else {
                  _isPlaying = true;
                  widget.controller.play();
                }
              });
            },
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, size: 60,),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds + 10));
            });
          },
          icon: const Icon(Icons.fast_forward, size: 40,),
        ),
      ],
    );
  }
}
