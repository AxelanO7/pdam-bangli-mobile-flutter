// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Complaint _$ComplainttFromJson(Map<String, dynamic> json) => Complaint()
  ..id = json['id'] as int
  ..customer = Customer.fromJson(json['pelanggan'] as Map<String, dynamic>)
  ..account = Account.fromJson(json['rekening'] as Map<String, dynamic>)
  ..complaint = json['keluhan'] as String
  ..linkPhoto = json['link_foto'] as String
  ..status = json['status'] as int
  ..officer = json['petugas'] == null
      ? null
      : Officer.fromJson(json['petugas'] as Map<String, dynamic>)
  ..rate = json['rate'] as int
  ..descriptionComplete = json['keterangan_selesai']
  ..dateComplete = json['tgl_selesai']
  ..score = json['nilai']
  ..dateReport = json['tgl_lapor'] as String
  ..dateConfirmationPdam = json['tgl_konfirmasi_pdam'] as String;

Map<String, dynamic> _$ComplaintToJson(Complaint instance) => <String, dynamic>{
      'id': instance.id,
      'pelanggan': instance.customer,
      'rekening': instance.account,
      'keluhan': instance.complaint,
      'link_foto': instance.linkPhoto,
      'status': instance.status,
      'petugas': instance.officer,
      'rate': instance.rate,
      'keterangan_selesai': instance.descriptionComplete,
      'tgl_selesai': instance.dateComplete,
      'nilai': instance.score,
      'tgl_lapor': instance.dateReport,
      'tgl_konfirmasi_pdam': instance.dateConfirmationPdam,
    };
