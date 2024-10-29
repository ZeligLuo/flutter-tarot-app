import 'package:flutter/material.dart';

class TarotSubInfoBlock extends StatelessWidget{
  final IconData icon;
  final String title;
  final String content;

  const TarotSubInfoBlock({Key? key, required this.icon, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: const Color(0xFF161440)),
        const SizedBox(
          height: 15,
        ),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.black45)),
        const SizedBox(
          height: 5,
        ),
        Text(content, style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700))
      ],
    );
  }
}