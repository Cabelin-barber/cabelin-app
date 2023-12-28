import "package:isar/isar.dart";

part 'user_model.g.dart';

@Collection()
class UserModel {
  Id index = 1;
  String id;
  String name;
  String email;
  String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}