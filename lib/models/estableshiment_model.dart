import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estableshiment_model.g.dart';

@JsonSerializable()
class EstablishmentModel {

  String id;
  String name;
  String urlImage;
  LocationModel location;

  EstablishmentModel({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.location
  });

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) => _$EstablishmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstablishmentModelToJson(this);
}