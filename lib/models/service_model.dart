import 'package:cabelin_v2/models/price_model.dart';
import 'package:cabelin_v2/models/professional_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {

  String id;
  String name;
  String description;
  int minutes;
  PriceModel price;
  List<ProfessionalModel> professionals;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.minutes,
    required this.price,
    required this.professionals
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}