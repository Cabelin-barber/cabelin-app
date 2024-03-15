import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {

  String currency = "brl";
  double value;

  PriceModel({
    this.currency = "brl",
    required this.value,

  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}