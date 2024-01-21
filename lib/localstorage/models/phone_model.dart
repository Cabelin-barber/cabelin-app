import 'package:json_annotation/json_annotation.dart';

part 'phone_model.g.dart';

@JsonSerializable()
class PhoneModel {

  String? id;
  String number;
  bool? isMobile = true;

  PhoneModel({
    this.id,
    required this.number,
    this.isMobile
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) => _$PhoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}