import 'package:animex/features/media/domain/anime_series.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultTile extends StatelessWidget {
  const ResultTile({super.key, required this.animeSeries});

  final AnimeSeries animeSeries;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row (
            children: [
              _cover(context, animeSeries.coverUrl.toString()),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(animeSeries.title),
                    Text(animeSeries.year, style: TextStyle(color: Colors.white.withOpacity(0.4)),),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.go("/homepage/search/showcase");
              },
            ),
          ),
        ),
      ],
    );
  }

  _cover(BuildContext context, String coverUrl) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Stack(
          children: [
            Container(
              height: 140,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
              ),
              child: const Icon(Icons.movie),
            ),
            Image.network(
              coverUrl,//"https://img.animeunity.to/anime/139965.jpg",
              fit: BoxFit.cover,
              height: 140,
              width: 90,
            ),
          ],
        ),
      );
  }
}
