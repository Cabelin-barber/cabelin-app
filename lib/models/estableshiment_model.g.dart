// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estableshiment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstablishmentModel _$EstablishmentModelFromJson(Map<String, dynamic> json) =>
    EstablishmentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture:
          PictureModel.fromJson(json['profilePicture'] as Map<String, dynamic>),
      address: LocationModel.fromJson(json['address'] as Map<String, dynamic>),
      openingHours: (json['openingHours'] as List<dynamic>)
          .map((e) => BusinessHours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EstablishmentModelToJson(EstablishmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'address': instance.address,
      'openingHours': instance.openingHours,
    };
