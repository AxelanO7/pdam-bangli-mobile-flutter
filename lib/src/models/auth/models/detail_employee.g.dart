// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailEmployee _$DetailEmployeeFromJson(Map<String, dynamic> json) => DetailEmployee()
  ..id = json['id'] as int
  ..userId = json['user_id'] as int
  ..nama = json['nama'] as String
  ..jabatan = json['jabatan'] as String
  ..areaId = json['area_id'] as int;

Map<String, dynamic> _$DetailEmployeeToJson(DetailEmployee instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'nama': instance.nama,
      'jabatan': instance.jabatan,
      'area_id': instance.areaId,
    };
