import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  const ResultTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row (
            children: [
              _cover(context),
              const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Text("One Piece")
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
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }

  _cover(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Stack(
          children: [
            Image.network(
              height: MediaQuery.of(context).size.height * 0.18,
              "https://img.animeunity.to/anime/139965.jpg",
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      );
  }

}
