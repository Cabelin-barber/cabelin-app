import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum Provider { google, apple, email }

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  Provider provider;
  String? phoneNumber;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.provider,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}