// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estableshiment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstablishmentModel _$EstablishmentModelFromJson(Map<String, dynamic> json) =>
    EstablishmentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      urlImage: json['urlImage'] as String,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EstablishmentModelToJson(EstablishmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'urlImage': instance.urlImage,
      'location': instance.location,
    };
