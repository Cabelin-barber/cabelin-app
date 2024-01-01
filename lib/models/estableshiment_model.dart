import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/models/picture_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estableshiment_model.g.dart';

@JsonSerializable()
class EstablishmentModel {

  String id;
  String name;
  PictureModel profilePicture;
  LocationModel address;

  EstablishmentModel({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.address
  });

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) => _$EstablishmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstablishmentModelToJson(this);
}