// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_complaints_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetComplaintsResponse _$GetReportResponseFromJson(Map<String, dynamic> json) => GetComplaintsResponse()
  ..id = json['id'] as int
  ..customer = Customer.fromJson(json['pelanggan'] as Map<String, dynamic>)
  ..account = Account.fromJson(json['rekening'] as Map<String, dynamic>)
  ..complaint = json['keluhan'] as String
  ..linkPhoto = json['link_foto'] as String
  ..status = json['status'] as int
  ..officer = json['petugas'] as String
  ..descriptionComplete = json['keterangan_selesai']
  ..dateComplete = json['tgl_selesai']
  ..score = json['nilai']
  ..dateReport = json['tgl_lapor'] as String
  ..dateConfirmationPdam = json['tgl_konfirmasi_pdam'] as String;

Map<String, dynamic> _$GetReportResponseToJson(GetComplaintsResponse instance) => <String, dynamic>{
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
