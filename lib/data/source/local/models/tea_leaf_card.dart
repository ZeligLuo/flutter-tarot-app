import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tea_leaf_card.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class TeaLeafCardHiveModel extends HiveObject{
  static const String boxKey = "teaLeafCard";

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String shortMeaning;

  @HiveField(3)
  late String fullMeaning;

  @HiveField(4)
  late int createdDate;

  @HiveField(5)
  late String imgPath;

  TeaLeafCardHiveModel({
    required this.id,
    required this.shortMeaning,
    required this.fullMeaning,
    required this.createdDate,
    required this.imgPath
  });

  factory TeaLeafCardHiveModel.fromJson(Map<String, dynamic> json) => _$TeaLeafCardHiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeaLeafCardHiveModelToJson(this);
}