// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tea_leaf_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeaLeafCardHiveModelAdapter extends TypeAdapter<TeaLeafCardHiveModel> {
  @override
  final int typeId = 1;

  @override
  TeaLeafCardHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeaLeafCardHiveModel(
      id: fields[0] as int,
      shortMeaning: fields[2] as String,
      fullMeaning: fields[3] as String,
      createdDate: fields[4] as int,
      imgPath: fields[5] as String,
    )..name = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, TeaLeafCardHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.shortMeaning)
      ..writeByte(3)
      ..write(obj.fullMeaning)
      ..writeByte(4)
      ..write(obj.createdDate)
      ..writeByte(5)
      ..write(obj.imgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeaLeafCardHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeaLeafCardHiveModel _$TeaLeafCardHiveModelFromJson(
        Map<String, dynamic> json) =>
    TeaLeafCardHiveModel(
      id: json['id'] as int,
      shortMeaning: json['shortMeaning'] as String,
      fullMeaning: json['fullMeaning'] as String,
      createdDate: json['createdDate'] as int,
      imgPath: json['imgPath'] as String,
    )..name = json['name'] as String;

Map<String, dynamic> _$TeaLeafCardHiveModelToJson(
        TeaLeafCardHiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortMeaning': instance.shortMeaning,
      'fullMeaning': instance.fullMeaning,
      'createdDate': instance.createdDate,
      'imgPath': instance.imgPath,
    };
