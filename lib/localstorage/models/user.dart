import "package:isar/isar.dart";

part "user.g.dart";

@Collection()
class User {
  Id index = 1;
  String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}