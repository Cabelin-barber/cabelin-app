import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum Provider { google, apple, email }

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  String provider;
  String? phone;
  LocationModel? location;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.provider,
    this.location,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}