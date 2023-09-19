import 'package:json_annotation/json_annotation.dart';

import '../models/detail_employee.dart';

part 'login_officer_response.g.dart';

@JsonSerializable()
class LoginOfficerResponse {
  LoginOfficerResponse();

  late bool status;
  late String message;
  late DetailEmployee detailEmployee;
  late String token;

  factory LoginOfficerResponse.fromJson(Map<String, dynamic> json) => _$LoginOfficerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginOfficerResponseToJson(this);
}
