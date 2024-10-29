import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:tarot_app/core/usecase.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_message.dart';
import 'package:tarot_app/env/env.dart';

class GeminiUseCases implements UseCase<TarotMessage?, List<TarotCard>>{
  @override
  Future<TarotMessage?> call(List<TarotCard> tarotCards) async{
    final aiModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: Env.apiKey,
      safetySettings: [
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none)
      ]
    );

    String overallMessage = "";
    String careerMessage = "";
    String romanceMessage = "";
    String healthMessage = "";

    await aiModel.generateContent([Content.text('Read overall message from 3 cards: ${tarotCards[0].name}, ${tarotCards[1].name}, ${tarotCards[2].name} in 5 sentences')]).then((value){
      overallMessage = value.text ?? "";
    });

    await aiModel.generateContent([Content.text('Read romance message from 3 cards: ${tarotCards[0].name}, ${tarotCards[1].name}, ${tarotCards[2].name} in 5 sentences')]).then((value){
      romanceMessage = value.text ?? "";
    });

    await aiModel.generateContent([Content.text('Read career message from 3 cards: ${tarotCards[0].name}, ${tarotCards[1].name}, ${tarotCards[2].name} in 5 sentences')]).then((value){
      careerMessage = value.text ?? "";
    });

    await aiModel.generateContent([Content.text('Read health message from 3 cards: ${tarotCards[0].name}, ${tarotCards[1].name}, ${tarotCards[2].name} in 5 sentences')]).then((value){
      healthMessage = value.text ?? "";
    });

    if(overallMessage == "" || romanceMessage == "" || careerMessage == "" || healthMessage == ""){
      return null;
    }
    else{
      TarotMessage tarotMessage = TarotMessage(overallMessage: overallMessage, careerMessage: careerMessage, romanceMessage: romanceMessage, healthMessage: healthMessage);

      return tarotMessage;
    }
  }
}