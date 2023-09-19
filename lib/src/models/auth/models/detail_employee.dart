import 'package:json_annotation/json_annotation.dart';


part 'detail_employee.g.dart';

@JsonSerializable()
class DetailEmployee {
  DetailEmployee();

  late int id;
  @JsonKey(name: 'user_id') late int userId;
  late String nama;
  late String jabatan;
  @JsonKey(name: 'area_id') late int areaId;

  factory DetailEmployee.fromJson(Map<String,dynamic> json) => _$DetailEmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$DetailEmployeeToJson(this);
}