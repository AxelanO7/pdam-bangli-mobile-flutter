import 'package:json_annotation/json_annotation.dart';


part 'officer.g.dart';

@JsonSerializable()
class Officer {
  Officer();

  late int id;
  @JsonKey(name: 'user_id') late int userId;
  late String name;
  late String position;
  @JsonKey(name: 'area_id') late int areaId;
  
  factory Officer.fromJson(Map<String,dynamic> json) => _$OfficerFromJson(json);
  Map<String, dynamic> toJson() => _$OfficerToJson(this);
}