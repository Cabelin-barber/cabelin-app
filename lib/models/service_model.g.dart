// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      minutes: json['minutes'] as int,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      professionals: ProfessionalModel.fromJson(
          json['professionals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'minutes': instance.minutes,
      'price': instance.price,
      'professionals': instance.professionals,
    };
