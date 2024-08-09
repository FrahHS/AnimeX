import 'package:animex/features/home/presentation/homepage_row.dart';
import 'package:animex/shared/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
            HomePageRow(),
          ],
        ),
      ),
    );
  }
}
