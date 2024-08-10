import 'package:flutter/material.dart';

class VideoToolbar extends StatefulWidget {
  const VideoToolbar({super.key});

  @override
  State<VideoToolbar> createState() => _VideoToolbarState();
}

class _VideoToolbarState extends State<VideoToolbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _button(const Icon(Icons.speed, weight: 1,), "Velocità (1x)"),
          _button(const Icon(Icons.list, weight: 1,), "Episodi"),
          _button(const Icon(Icons.subtitles_outlined, weight: 1,), "Audio e sottotitoli"),
          _button(const Icon(Icons.skip_next, weight: 1,), "Prossimo ep."),
        ],
      ),
    );
  }

  Widget _button(Widget icon, String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        )),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5,),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
        ],
      )
    );
  }
}
