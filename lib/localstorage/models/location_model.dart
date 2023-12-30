import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {

  String city;
  String state;
  String latitude;
  String longitude;

  LocationModel({
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}