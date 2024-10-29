import 'package:flutter/material.dart';

class ReadingMethodMenuItem extends StatelessWidget{
  ReadingMethodMenuItem({
    Key? key,
    required this.content,
    required this.value,
  }) : super(key: key);

  final String content;
  final String value;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Colors.lightGreen : Colors.black45
        )
      ),
      child: GestureDetector(
        onTap: (){
          selected = !selected;

        },
        child: Text(content),
      ),
    );
  }
}
