import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold  extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.showLogo = false,
    this.showSearch = false,
  });

  final Widget body;
  final bool showLogo;
  final bool showSearch;

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black.withOpacity((_scrollControllerOffset / 250).clamp(0, 0.8).toDouble()),
        title: Visibility(
          visible: widget.showLogo,
          child: const FlutterLogo(size: 40,),
        ),
        actions: [
          Visibility(
            visible: widget.showSearch,
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
      ),
      body: CustomScrollView(
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
    );
  }
}
