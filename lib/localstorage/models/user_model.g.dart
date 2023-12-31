// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'provider': _$ProviderEnumMap[instance.provider]!,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
    };

const _$ProviderEnumMap = {
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
};
