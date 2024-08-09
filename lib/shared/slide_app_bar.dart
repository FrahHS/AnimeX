import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SlideAppBar({
    super.key,
    required this.scrollOffset,
    this.height = 50,
    this.showLogo = false,
    this.showSearch = false
  });

  final double height ;
  final double scrollOffset;
  final bool showLogo;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.black.withOpacity((scrollOffset / 250).clamp(0, 0.8).toDouble()),
      title: Visibility(
        visible: showLogo,
        child: FlutterLogo(size: height * 0.8,),
      ),
      actions: [
        Visibility(
          visible: showSearch,
          child: IconButton(
            onPressed: () {
              context.go("/homepage/search");
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
