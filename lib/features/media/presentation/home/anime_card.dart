import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key, required this.onTap});

  final VoidCallback?  onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: [
                Image.network(
                  height: MediaQuery.of(context).size.height * 0.2,
                  "https://img.animeunity.to/anime/139965.jpg",
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          child: Text("One Piece", style: TextStyle(fontSize: 14),)
        ),
      ],
    );
  }

}
