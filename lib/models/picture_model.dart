import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';

@JsonSerializable()
class PictureModel {

  String id;
  String? name;
  String url;

  PictureModel({
    required this.id,
    required this.url,
    this.name,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}