import 'package:tarot_app/data/source/firebase/models/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';

extension FirebaseTarotCardModelX on FirebaseTarotCardModel{
  TarotCard toEntity() => TarotCard(
      id: id,
      name: name,
      imgUrl: imgUrl,
      keywords: keywords,
      cardDescription: cardDescription,
      meaning: meaning,
      loveMeaning: loveMeaning,
      careerMeaning: careerMeaning,
      financesMeaning: financesMeaning,
      astrology: astrology,
      element: element,
      zodiac: zodiac,
      type: type == 0 ? "Major Arcana" : "Minor Arcana",
      createdDate: DateTime.fromMillisecondsSinceEpoch(createdDate)
  );
}