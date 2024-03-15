import 'package:json_annotation/json_annotation.dart';

part 'hour_of_service_model.g.dart';

@JsonSerializable()
class HourOfServiceModel {
  String? startHour;
  String? endHour;

  HourOfServiceModel({required this.startHour, required this.endHour});

  factory HourOfServiceModel.fromJson(Map<String, dynamic> json) => _$HourOfServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$HourOfServiceModelToJson(this);
}