import 'package:cabelin_v2/models/picture_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'professional_model.g.dart';

@JsonSerializable()
class ProfessionalModel {

  String id;
  String name;
  bool active;
  //PictureModel profilePicture;

  ProfessionalModel({
    required this.id,
    required this.name,
    required this.active
    //required this.profilePicture
  });

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) => _$ProfessionalModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfessionalModelToJson(this);
}