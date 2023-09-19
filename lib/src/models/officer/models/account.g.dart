// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account()
  ..id = json['id'] as int
  ..customerId = json['pelanggan_id'] as int
  ..numberBankAccount = json['no_rekening'] as String
  ..subdistrictId = json['kecamatan_id']
  ..wardId = json['kelurahan_id']
  ..areaId = json['area_id']
  ..lat = json['lat'] as String
  ..lng = json['lng'] as String
  ..deviceToken = json['device_token'] as String
  ..register = json['register'] as int;

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'pelanggan_id': instance.customerId,
      'no_account': instance.numberBankAccount,
      'kecamatan_id': instance.subdistrictId,
      'kelurahan_id': instance.wardId,
      'area_id': instance.areaId,
      'lat': instance.lat,
      'lng': instance.lng,
      'device_token': instance.deviceToken,
      'register': instance.register,
    };
