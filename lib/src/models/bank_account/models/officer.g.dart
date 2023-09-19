// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'officer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Officer _$OfficerFromJson(Map<String, dynamic> json) => Officer()
  ..id = json['id'] as int
  ..userId = json['user_id'] as int
  ..name = json['nama'] as String
  ..position = json['jabatan'] as String
  ..areaId = json['area_id'] as int;

Map<String, dynamic> _$OfficerToJson(Officer instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'nama': instance.name,
      'jabatan': instance.position,
      'area_id': instance.areaId,
    };
