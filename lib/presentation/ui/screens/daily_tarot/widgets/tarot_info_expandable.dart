import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TarotInfoExpandable extends StatefulWidget{
  final IconData icon;
  final String title;
  final String content;

  const TarotInfoExpandable({Key? key, required this.icon, required this.title, required this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TarotInfoExpandableState();
}

class TarotInfoExpandableState extends State<TarotInfoExpandable>{
  final ExpandableController _expandableController = ExpandableController(initialExpanded: true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _expandableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpandableNotifier(
            controller: _expandableController,
            child: ScrollOnExpand(
              child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                  ),
                  header: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Row(
                        children: [
                          Icon(
                            widget.icon,
                            color: const Color(0xFF161440),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(widget.title, style: const TextStyle(fontSize: 16, color: Color(0xFF161440), fontWeight: FontWeight.w700))
                        ]
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                    margin: const EdgeInsets.all(0.8),
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey
                          )
                        ),
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(widget.content, textAlign: TextAlign.left),
                            )
                        )
                      ],
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }
}