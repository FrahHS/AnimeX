import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {

  late TextEditingController _textController;
  String _textControllerText = "";

  _scrollListener() {
    setState(() {
      _textControllerText = _textController.text;
    });
  }

  @override
  void initState() {
    _textController = TextEditingController();
    _textController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 44, 44, 44),
          padding: const EdgeInsets.fromLTRB(12.5, 2.5, 12.5, 2.5),
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Cerca anime',
              hintStyle: TextStyle(fontWeight: FontWeight.w400),
              icon: Icon(Icons.search, size: 30,),
              fillColor: Colors.grey,
            ),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Visibility(
          visible: _textControllerText != "",
          child: Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                _textController.text = "";
              },
              icon: const Icon(Icons.close),
            ),
          )
        ),
        Visibility(
          visible: _textControllerText == "",
          child: Positioned(
            right: 0,
            child: IconButton(
              onPressed: () async {
                //TODO
              },
              icon: const Icon(Icons.mic_none),
            ),
          )
        ),
      ],
    );
  }
}
