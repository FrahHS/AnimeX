import 'package:flutter/material.dart';

class ShowcaseEpisode extends StatelessWidget {
  const ShowcaseEpisode({super.key});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: SizedBox(
                    height: 95,
                    width: 150,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            fit: BoxFit.cover,
                            height: 95,
                            width: 150,
                            'https://img.animeunity.to/anime/139965.jpg'
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.play_circle_outline, size: 40,),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Episodio 1", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("23m", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14, color: Colors.white.withOpacity(0.45)),),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.download_sharp),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
