import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_bangli/src/models/officer/models/account.dart';
import 'package:pdam_bangli/src/models/officer/models/customer.dart';

import 'officer.dart';

part 'complaint.g.dart';

@JsonSerializable()
class Complaint {
  Complaint();

  late int id;
  late Customer customer;
  late Account account;
  late String complaint;
  late String linkPhoto;
  late int status;
  late Officer? officer;
  late int rate;
  @JsonKey(name: 'keterangan_selesai') late dynamic descriptionComplete;
  @JsonKey(name: 'tgl_selesai') late dynamic dateComplete;
  late dynamic score;
  @JsonKey(name: 'tgl_lapor') late String dateReport;
  @JsonKey(name: 'tgl_konfirmasi_pdam') late String dateConfirmationPdam;

  factory Complaint.fromJson(Map<String,dynamic> json) => _$ComplainttFromJson(json);
  Map<String, dynamic> toJson() => _$ComplaintToJson(this);
}