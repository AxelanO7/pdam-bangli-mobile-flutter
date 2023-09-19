// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report()
  ..id = json['id'] as int
  ..customer = Customer.fromJson(json['pelanggan'] as Map<String, dynamic>)
  ..account = Account.fromJson(json['rekening'] as Map<String, dynamic>)
  ..complaint = json['keluhan'] as String
  ..linkPhoto = json['link_foto'] as String
  ..status = json['status'] as int
  ..officer = json['petugas']
  ..descriptionComplete = json['keterangan_selesai']
  ..dateComplete = json['tgl_selesai']
  ..score = json['nilai']
  ..dateReport = json['tgl_lapor'] as String
  ..dateConfirmationPdam = json['tgl_konfirmasi_pdam'] as String;

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'pelanggan': instance.customer,
      'rekening': instance.account,
      'keluhan': instance.complaint,
      'link_foto': instance.linkPhoto,
      'status': instance.status,
      'petugas': instance.officer,
      'keterangan_selesai': instance.descriptionComplete,
      'tgl_selesai': instance.dateComplete,
      'nilai': instance.score,
      'tgl_lapor': instance.dateReport,
      'tgl_konfirmasi_pdam': instance.dateConfirmationPdam,
    };
