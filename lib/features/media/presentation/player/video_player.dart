import 'dart:async';

import 'package:animex/features/media/presentation/player/tools/video_control_buttons.dart';
import 'package:animex/features/media/presentation/player/tools/video_timeline.dart';
import 'package:animex/features/media/presentation/player/tools/video_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool showTools = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return PopScope(
      onPopInvoked: (pop) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ]);

        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
        ));

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            showTools = !showTools;
          });
        },
        child: Scaffold(
          // Use a FutureBuilder to display a loading spinner while waiting for the
          // VideoPlayerController to finish initializing.
          extendBodyBehindAppBar: true,
          body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                
                return Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    VideoPlayerTools(controller: _controller, visible: showTools,),
                  ],
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}


class VideoPlayerTools extends StatefulWidget {
  const VideoPlayerTools({super.key, required this.controller, required this.visible});

  final VideoPlayerController controller;
  final bool visible;

  @override
  State<VideoPlayerTools> createState() => _VideoPlayerToolsState();
}

class _VideoPlayerToolsState extends State<VideoPlayerTools> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.visible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        opacity: widget.visible ? 1 : 0,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.visible,
              child: Center(
                child: VideoControlButtons(controller: widget.controller,)
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              offset: widget.visible ? const Offset(0.0, 0.0) : const Offset(0.0, -0.52),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back, size: 28,),
                    ),
                    const Text("S1:E33 One Piece", style: TextStyle(fontSize: 15),),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cast),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.visible,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: VideoTimeline(
                  controller: widget.controller,
                ),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              offset: widget.visible ? const Offset(0.0, 0.0) : const Offset(0.0, 0.1),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoToolbar(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
