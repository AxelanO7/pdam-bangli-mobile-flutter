import 'package:json_annotation/json_annotation.dart';


part 'customer.g.dart';

@JsonSerializable()
class Customer {
      Customer();

  late int id;
  @JsonKey(name: 'user_id') late int userId;
  @JsonKey(name: 'no_pelanggan') late String numberCustomer;
  @JsonKey(name: 'nama_pelanggan') late String nameCustomer;
  @JsonKey(name: 'nik_pelanggan') late String ninCustomer;
  @JsonKey(name: 'alamat_pelanggan') late String addressCustomer;
  @JsonKey(name: 'kecamatan_id') dynamic subdistrictId;
  @JsonKey(name: 'kelurahan_id') dynamic wardId;
  @JsonKey(name: 'golongan_id') late int typeId;
  @JsonKey(name: 'created_at') late String createdAt;

  factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
