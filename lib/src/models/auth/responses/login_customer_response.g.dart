// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCustomerResponse _$LoginCustomerResponseFromJson(Map<String, dynamic> json) => LoginCustomerResponse()
  ..status = json['status'] as bool
  ..message = json['message'] as String
  ..token = json['token'] as String;

Map<String, dynamic> _$LoginCustomerResponseToJson(LoginCustomerResponse instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };
