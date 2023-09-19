import 'package:json_annotation/json_annotation.dart';

import '../models/detail_employee.dart';

part 'login_customer_response.g.dart';

@JsonSerializable()
class LoginCustomerResponse {
  LoginCustomerResponse();

  late bool status;
  late String message;
  late String token;

  factory LoginCustomerResponse.fromJson(Map<String, dynamic> json) => _$LoginCustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginCustomerResponseToJson(this);
}
