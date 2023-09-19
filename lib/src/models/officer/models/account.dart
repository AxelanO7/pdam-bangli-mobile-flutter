import 'package:json_annotation/json_annotation.dart';


part 'account.g.dart';

@JsonSerializable()
class Account {
  Account();

  late int id;
  @JsonKey(name: 'pelanggan_id') late int customerId;
  @JsonKey(name: 'no_rekening') late String numberBankAccount;
  @JsonKey(name: 'kecamatan_id') dynamic subdistrictId;
  @JsonKey(name: 'kelurahan_id') dynamic wardId;
  @JsonKey(name: 'area_id') dynamic areaId;
  late String lat;
  late String lng;
  @JsonKey(name: 'device_token') late String deviceToken;
  late int register;

  factory Account.fromJson(Map<String,dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}