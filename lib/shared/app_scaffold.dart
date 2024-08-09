import 'package:animex/shared/slide_app_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold  extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                  child: widget.body,
                ),
              )
            ],
          ),
          SlideAppBar(
            scrollOffset: _scrollControllerOffset,
          ),
        ],
      ),
    );
  }
}
