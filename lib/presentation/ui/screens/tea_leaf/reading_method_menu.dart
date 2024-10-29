import 'package:flutter/cupertino.dart';
import 'package:tarot_app/presentation/ui/screens/tea_leaf/widgets/reading_method_menu_item.dart';

class ReadingMethodMenu extends StatefulWidget{
  const ReadingMethodMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReadingMethodMenuState();
}

class ReadingMethodMenuState extends State<ReadingMethodMenu>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Choose 1 method:"),
        ReadingMethodMenuItem(content: "Next Month", value: "month"),
        ReadingMethodMenuItem(content: "Next Year", value: "year"),
        ReadingMethodMenuItem(content: "Astral House", value: "house"),

      ],
    );
  }
}