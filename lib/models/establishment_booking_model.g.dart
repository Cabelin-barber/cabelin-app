// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstablishmentBookingModel _$EstablishmentBookingModelFromJson(
        Map<String, dynamic> json) =>
    EstablishmentBookingModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture:
          PictureModel.fromJson(json['profilePicture'] as Map<String, dynamic>),
      address: LocationModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EstablishmentBookingModelToJson(
        EstablishmentBookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'address': instance.address,
    };
