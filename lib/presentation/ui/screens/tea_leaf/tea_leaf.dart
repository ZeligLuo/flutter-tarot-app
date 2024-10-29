import 'package:flutter/material.dart';
import 'package:tarot_app/presentation/ui/screens/tea_leaf/reading_method_menu.dart';

class TeaLeafScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TeaLeafScreenState();
}

class TeaLeafScreenState extends State<TeaLeafScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width / 1.5
          ),
          child: ReadingMethodMenu(),
        ),
      ),
    );
  }
}