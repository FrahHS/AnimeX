import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationPage  extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.body,
  });

  final StatefulNavigationShell body;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.body.currentIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          onTap: (index) {
            widget.body.goBranch(
              index,
              initialLocation: index == widget.body.currentIndex,
            );
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
