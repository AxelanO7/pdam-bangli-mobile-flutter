// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer()
  ..id = json['id'] as int
  ..userId = json['user_id'] as int
  ..numberCustomer = json['no_pelanggan'] as String
  ..nameCustomer = json['nama_pelanggan'] as String
  ..ninCustomer = json['nik_pelanggan'] as String
  ..addressCustomer = json['alamat_pelanggan'] as String
  ..subdistrictId = json['kecamatan_id']
  ..wardId = json['kelurahan_id']
  ..typeId = json['golongan_id'] as int
  ..createdAt = json['created_at'] as String;

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'no_pelanggan': instance.numberCustomer,
      'nama_pelanggan': instance.nameCustomer,
      'nik_pelanggan': instance.ninCustomer,
      'alamat_pelanggan': instance.addressCustomer,
      'kecamatan_id': instance.subdistrictId,
      'kelurahan_id': instance.wardId,
      'golongan_id': instance.typeId,
      'created_at': instance.createdAt,
    };
