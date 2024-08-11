import 'package:animex/features/media/presentation/showcase/widget/showcase_button_bar.dart';
import 'package:animex/features/media/presentation/showcase/widget/showcase_episode.dart';
import 'package:animex/services/logger.dart';
import 'package:animex/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppScaffold(
      showSearch: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://img.animeunity.to/anime/139965.jpg',
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Title
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('One Piece', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                // Play button
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: TextButton(
                    onPressed: () {
                      logger.d(GoRouter.of(context).routeInformationProvider.value.uri);
                      context.go('${GoRouter.of(context).routeInformationProvider.value.uri}/player');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      overlayColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.2)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.black,),
                          SizedBox(width: 5,),
                          Text('Riproduci', style: TextStyle(color: Colors.black, fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ),
                // Description
                const ReadMoreText(
                  'Mollit ea occaecat ea ad id est nulla magna consectetur fugiat. Dolore proident exercitation est mollit elit consectetur ad duis non cupidatat laboris ea commodo elit. Aliqua sint enim consectetur voluptate dolore veniam ullamco qui. Eiusmod incididunt eiusmod occaecat culpa et ex. Ad excepteur ex magna ullamco ex Lorem aute proident eiusmod non anim ipsum nostrud amet. Esse voluptate do id officia dolor nisi qui consequat. In occaecat laboris non aliquip non ea veniam.',
                  style: TextStyle(fontSize: 14),
                  trimLength: 180,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // Author
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 6, 0.0, 0.0),
                    child: ReadMoreText(
                      trimLength: 36,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      'Autore: Eichiro Oda, Eichiro Oda, Eichiro Oda, Eichiro Oda, Eichiro Oda, Eichiro Oda, Eichiro Oda, Eichiro Oda',
                      style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ),
                // Buttons
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: ShowcaseButtonBar(),
                ),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.white.withOpacity(0.2),),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
          const ShowcaseEpisode(),
        ],
      ),
    );
  }

}
