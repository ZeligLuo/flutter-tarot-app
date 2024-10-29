import 'package:flutter/material.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_message.dart';

class DailyTarotDetailsScreen extends StatelessWidget{
  final List<TarotCard> pickedTarotCards;
  final TarotMessage pickedCardsMessage;

  const DailyTarotDetailsScreen({Key? key, required this.pickedTarotCards, required this.pickedCardsMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child:  Column(
            children: [

            ],
          )
      ),
    );
  }
}
