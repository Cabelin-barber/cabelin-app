import 'package:json_annotation/json_annotation.dart';

part 'search_location_model.g.dart';

@JsonSerializable()
class SearchLocationModel {

  String fullAdress;
  String formattedAdress;

  SearchLocationModel({
    required this.fullAdress,
    required this.formattedAdress,
  });

  factory SearchLocationModel.fromJson(Map<String, dynamic> json) => _$SearchLocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchLocationModelToJson(this);
}