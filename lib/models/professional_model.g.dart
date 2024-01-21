// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionalModel _$ProfessionalModelFromJson(Map<String, dynamic> json) =>
    ProfessionalModel(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$ProfessionalModelToJson(ProfessionalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };
