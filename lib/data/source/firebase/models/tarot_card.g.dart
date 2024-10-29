// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarot_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseTarotCardModel _$FirebaseTarotCardModelFromJson(
        Map<String, dynamic> json) =>
    FirebaseTarotCardModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      cardDescription: json['cardDescription'] as String,
      meaning: json['meaning'] as String,
      loveMeaning: json['loveMeaning'] as String,
      careerMeaning: json['careerMeaning'] as String,
      financesMeaning: json['financesMeaning'] as String,
      astrology: json['astrology'] as String,
      element: json['element'] as String,
      zodiac: json['zodiac'] as String,
      type: json['type'] as int,
      createdDate: json['createdDate'] as int,
      modifiedDate: json['modifiedDate'] as int?,
      deletedDate: json['deletedDate'] as int?,
    );

Map<String, dynamic> _$FirebaseTarotCardModelToJson(
        FirebaseTarotCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'keywords': instance.keywords,
      'cardDescription': instance.cardDescription,
      'meaning': instance.meaning,
      'loveMeaning': instance.loveMeaning,
      'careerMeaning': instance.careerMeaning,
      'financesMeaning': instance.financesMeaning,
      'astrology': instance.astrology,
      'element': instance.element,
      'zodiac': instance.zodiac,
      'type': instance.type,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'deletedDate': instance.deletedDate,
    };
