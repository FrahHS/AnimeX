import 'package:flutter/material.dart';

class SlideAppBar extends StatelessWidget {
  const SlideAppBar({super.key, required this.scrollOffset, this.height = 80});

  final double height ;
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, height),
      child: SafeArea(
        top: false,
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity((scrollOffset / 250).clamp(0, 0.8).toDouble()),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  const Positioned(
                    left: 0,
                    child: FlutterLogo(size: 40,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
