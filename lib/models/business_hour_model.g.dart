// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessHours _$BusinessHoursFromJson(Map<String, dynamic> json) =>
    BusinessHours(
      dayOfWeek: json['dayOfWeek'] as String,
      active: json['active'] as bool,
      hourOfService: HourOfServiceModel.fromJson(
          json['hourOfService'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessHoursToJson(BusinessHours instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'active': instance.active,
      'hourOfService': instance.hourOfService,
    };
