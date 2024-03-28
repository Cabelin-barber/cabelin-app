import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/models/picture_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'establishment_booking_model.g.dart';

@JsonSerializable()
class EstablishmentBookingModel {

  String id;
  String name;
  PictureModel profilePicture;
  LocationModel address;

  EstablishmentBookingModel({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.address,
  });

  factory EstablishmentBookingModel.fromJson(Map<String, dynamic> json) => _$EstablishmentBookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$EstablishmentBookingModelToJson(this);
}