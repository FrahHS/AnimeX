import 'package:animex/features/media/data/animeunity_repo.dart';
import 'package:animex/features/media/domain/anime_series.dart';
import 'package:animex/features/media/presentation/search/result_tile.dart';
import 'package:animex/features/media/presentation/search/search_bar.dart';
import 'package:animex/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SearchScreen  extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;
  String _searchText = "";

  void _textListener() {
    if(_textEditingController.text != _searchText || _searchText == "") {
      setState(() {
        logger.d("previous text: ${_textEditingController.text}\ntext: $_searchText");
        _searchText = _textEditingController.text;
      });
    }
  }

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_textListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          AppSearchBar(
            textController: _textEditingController,
          ),
          Expanded(
            child: FutureBuilder(
              future: AnimeunityRepo.search(_searchText),
              initialData: const [],
              builder: (context, snapshot) {
                if(_searchText == '') {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 150, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Trova qualcosa da guardare.", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Cerca serie, film o anime di ogni genere.", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6)),),
                      ],
                    ),
                  );
                }
                if(snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<AnimeSeries> mediaList = snapshot.data as List<AnimeSeries>;
                List<ResultTile> resultTileList = [];
                for(int i = 0; i < mediaList.length; i++) {
                  resultTileList.add(
                    ResultTile(animeSeries: mediaList[i])
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  children: resultTileList,
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
