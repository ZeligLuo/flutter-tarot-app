import 'package:json_annotation/json_annotation.dart';
part 'tarot_card.g.dart';

@JsonSerializable()
class FirebaseTarotCardModel{
  final int id;
  final String name;
  final String imgUrl;
  final List<String> keywords;
  final String cardDescription;
  final String meaning;
  final String loveMeaning;
  final String careerMeaning;
  final String financesMeaning;
  final String astrology;
  final String element;
  final String zodiac;
  final int type;
  final int createdDate;
  final int? modifiedDate;
  final int? deletedDate;

  FirebaseTarotCardModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.keywords,
    required this.cardDescription,
    required this.meaning,
    required this.loveMeaning,
    required this.careerMeaning,
    required this.financesMeaning,
    required this.astrology,
    required this.element,
    required this.zodiac,
    required this.type,
    required this.createdDate,
    this.modifiedDate,
    this.deletedDate
  });

  factory FirebaseTarotCardModel.fromJson(Map<String, dynamic> json) => _$FirebaseTarotCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseTarotCardModelToJson(this);
}