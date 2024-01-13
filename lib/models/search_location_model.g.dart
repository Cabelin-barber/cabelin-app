// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchLocationModel _$SearchLocationModelFromJson(Map<String, dynamic> json) =>
    SearchLocationModel(
      fullAdress: json['fullAdress'] as String,
      formattedAdress: json['formattedAdress'] as String,
    );

Map<String, dynamic> _$SearchLocationModelToJson(
        SearchLocationModel instance) =>
    <String, dynamic>{
      'fullAdress': instance.fullAdress,
      'formattedAdress': instance.formattedAdress,
    };
