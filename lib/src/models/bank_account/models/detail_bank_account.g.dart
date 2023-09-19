// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailBankAccount _$DetailBankAccountFromJson(Map<String, dynamic> json) => DetailBankAccount()
  ..id = json['id'] as int
  ..numberBankAccount = json['no_rekening'] as int
  ..subdistrict = json['kecamatan']
  ..ward = json['kelurahan']
  ..customer = Customer.fromJson(json['pelanggan'] as Map<String, dynamic>)
  ..lat = json['lat'] as String
  ..lng = json['lng'] as String;

Map<String, dynamic> _$DetailBankAccountToJson(DetailBankAccount instance) => <String, dynamic>{
      'id': instance.id,
      'no_rekening': instance.numberBankAccount,
      'kecamatan': instance.subdistrict,
      'kelurahan': instance.ward,
      'pelanggan': instance.customer,
      'lat': instance.lat,
      'lng': instance.lng,
    };
