import 'package:json_annotation/json_annotation.dart';

import '../../officer/models/customer.dart';

part 'detail_bank_account.g.dart';

@JsonSerializable()
class DetailBankAccount {
  DetailBankAccount();

  late int id;
  @JsonKey(name: 'no_rekening') late int numberBankAccount;
  late dynamic subdistrict;
  late dynamic ward;
  late Customer customer;
  late String lat;
  late String lng;

  factory DetailBankAccount.fromJson(Map<String, dynamic> json) => _$DetailBankAccountFromJson(json);
  Map<String, dynamic> toJson() => _$DetailBankAccountToJson(this);
}
