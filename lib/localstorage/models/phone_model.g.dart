// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) => PhoneModel(
      id: json['id'] as String?,
      number: json['number'] as String,
      isMobile: json['isMobile'] as bool?,
    );

Map<String, dynamic> _$PhoneModelToJson(PhoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'isMobile': instance.isMobile,
    };
