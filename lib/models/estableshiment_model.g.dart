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
    );

Map<String, dynamic> _$EstablishmentModelToJson(EstablishmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'address': instance.address,
    };
