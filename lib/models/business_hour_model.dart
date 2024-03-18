import 'package:cabelin_v2/models/hour_of_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_hour_model.g.dart';

@JsonSerializable()
class BusinessHours {
  String dayOfWeek;
  bool active;
  HourOfServiceModel hourOfService;

  BusinessHours({required this.dayOfWeek, required this.active, required this.hourOfService});

  factory BusinessHours.fromJson(Map<String, dynamic> json) => _$BusinessHoursFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessHoursToJson(this);
}