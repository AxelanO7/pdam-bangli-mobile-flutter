import 'package:json_annotation/json_annotation.dart';
import 'account.dart';
import 'customer.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  Report();

  late int id;
  late Customer customer;
  late Account account;
  late String complaint;
  late String linkPhoto;
  late int status;
  late dynamic officer;
  @JsonKey(name: 'keterangan_selesai') late dynamic descriptionComplete;
  @JsonKey(name: 'tgl_selesai') late dynamic dateComplete;
  late dynamic score;
  @JsonKey(name: 'tgl_lapor') late String dateReport;
  @JsonKey(name: 'tgl_konfirmasi_pdam') late String dateConfirmationPdam;

  factory Report.fromJson(Map<String,dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}