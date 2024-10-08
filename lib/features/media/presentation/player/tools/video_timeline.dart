import 'package:animex/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoTimeline extends StatefulWidget {
  const VideoTimeline({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VideoTimeline> createState() => _VideoTimelineState();
}

class _VideoTimelineState extends State<VideoTimeline> {
  final double _cursorRadius = 22;

  late double _barLenght;
  late double _cursorPosition;
  late double _barPosition;
  late String _positionText;
  bool _isDragging = false;

  @override
  void initState() {
    checkVideo();
    widget.controller.addListener(checkVideo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _barLenght = MediaQuery.of(context).size.width * 0.85;

    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onPanStart: (details) {
              _isDragging = true;
            },
            onPanEnd: (details) {
              _isDragging = false;
              setState(() {
                _cursorPosition = (details.localPosition.dx / _barLenght).clamp(0, 1);
                widget.controller.seekTo(Duration(seconds: (_cursorPosition * widget.controller.value.duration.inSeconds).toInt()));
                logger.d(_cursorPosition);
              });
            },
            // Cursor drag
            onPanUpdate: (details) {
              setState(() {
                _cursorPosition = (details.localPosition.dx / _barLenght).clamp(0, 1);
                if(_cursorPosition >= _barPosition - 0.002 && _cursorPosition <= _barPosition + 0.002) {
                  HapticFeedback.vibrate();
                }

                logger.d(_cursorPosition);
              });
            },
            onTapDown: (details) {
              _isDragging = true;
              setState(() {
                _cursorPosition = (details.localPosition.dx / _barLenght).clamp(0, 1);
                logger.d(_cursorPosition);
              });
            },
            onTapUp: (details) {
              _isDragging = false;
              logger.d("up");
              setState(() {
                widget.controller.seekTo(Duration(seconds: (_cursorPosition * widget.controller.value.duration.inSeconds).toInt()));
                logger.d(_cursorPosition);
              });
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: _barLenght + _cursorRadius,
                  height: _cursorRadius*2,
                  color: Colors.transparent,
                ),
                Container(
                  width: _barLenght,
                  height: 2,
                  color: Colors.grey,
                ),
                Positioned(
                  left: _cursorRadius / 2,
                  child: Container(
                    width: _barPosition * _barLenght,
                    height: 2,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  left: _cursorPosition * _barLenght,
                  child: Container(
                    width: _cursorRadius,
                    height: _cursorRadius,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
            child: Text(_positionText, style: const TextStyle(fontSize: 14),),
          )
        ],
      ),
    );
  }

  void checkVideo(){
    setState(() {
      if(!_isDragging) {
        _cursorPosition = widget.controller.value.position.inSeconds / widget.controller.value.duration.inSeconds;
      }
      _barPosition = widget.controller.value.position.inSeconds / widget.controller.value.duration.inSeconds;
      _positionText = _durationToString(
        Duration(seconds: (widget.controller.value.duration.inSeconds - widget.controller.value.position.inSeconds))
      );
    });
  }

  String _durationToString(Duration duration) {
    String str = duration.toString();
    str = str.split('.')[0];
    if(str.split(':')[0] == '0') {
      str = (str.split(':')..removeAt(0)).join(":");
    }

    return str;
  }
}
