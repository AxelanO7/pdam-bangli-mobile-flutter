// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_officer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOfficerResponse _$LoginOfficerResponseFromJson(Map<String, dynamic> json) => LoginOfficerResponse()
  // ..data = AuthDefault.fromJson(json['data'] as Map<String, dynamic>)
  ..status = json['status'] as bool
  ..message = json['message'] as String
  ..detailEmployee = DetailEmployee.fromJson(json['detail_pegawai'] as Map<String, dynamic>)
  ..token = json['token'] as String;

Map<String, dynamic> _$LoginOfficerResponseToJson(LoginOfficerResponse instance) => <String, dynamic>{
      // 'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'detailEmployee': instance.detailEmployee,
      'token': instance.token,
    };
