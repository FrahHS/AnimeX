import 'package:flutter/material.dart';

class ShowcaseButtonBar extends StatelessWidget {
  const ShowcaseButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _button(Icons.add, 'Salva'),
          _button(Icons.thumb_up, 'Valuta'),
          _button(Icons.download, 'Scarica'),
        ],
      ),
    );
  }

  Widget _button(IconData icon, String text) {
    return IconButton(
      onPressed: () {},
      icon: Column(
        children: [
          Icon(icon, size: 25,),
          const SizedBox(height: 4,),
          Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: Colors.white.withOpacity(0.7)),)
        ],
      ),
    );
  }
}
