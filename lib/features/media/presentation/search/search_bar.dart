import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 44, 44, 44),
          padding: const EdgeInsets.fromLTRB(12.5, 2.5, 12.5, 2.5),
          child: TextField(
            autofocus: true,
            focusNode: _focusNode,
            onTapOutside: (event) => _focusNode.unfocus(),
            controller: widget.textController,
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
          visible: widget.textController.text != "",
          child: Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                widget.textController.text = "";
              },
              icon: const Icon(Icons.close),
            ),
          )
        ),
        Visibility(
          visible: widget.textController.text == "",
          child: Positioned(
            right: 0,
            child: IconButton(
              onPressed: () async {
                //TODO: voice to text
              },
              icon: const Icon(Icons.mic_none),
            ),
          )
        ),
      ],
    );
  }
}
