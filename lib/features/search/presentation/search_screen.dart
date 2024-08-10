import 'package:animex/features/search/presentation/result_tile.dart';
import 'package:animex/features/search/presentation/search_bar.dart';
import 'package:animex/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen  extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const AppSearchBar(),
          Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  ResultTile(),
                  
                ],
              )
          ),
        ],
      )
    );
  }
}
