import 'package:json_annotation/json_annotation.dart';

import '../../officer/models/account.dart';
import '../../officer/models/customer.dart';

part 'get_complaints_response.g.dart';

@JsonSerializable()
class GetComplaintsResponse {
  GetComplaintsResponse();

  late int id;
  late Customer customer;
  late Account account;
  late String complaint;
  late String linkPhoto;
  late int status;
  late String officer;
  @JsonKey(name: 'keterangan_selesai') late dynamic descriptionComplete;
  @JsonKey(name: 'tgl_selesai') late dynamic dateComplete;
  late dynamic score;
  @JsonKey(name: 'tgl_lapor') late String dateReport;
  @JsonKey(name: 'tgl_konfirmasi_pdam') late String dateConfirmationPdam;

  factory GetComplaintsResponse.fromJson(Map<String, dynamic> json) => _$GetReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetReportResponseToJson(this);
}
