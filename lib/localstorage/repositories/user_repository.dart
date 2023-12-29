import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class UserRepository {
  late LocalStorage storage;

  UserRepository() {
    storage = openDatabase();
  }

  Future<UserModel> saveUser(UserModel newUser) async {
    await storage.setItem("info", newUser.toJson());
    return newUser;
  }

  UserModel? getUser() {
    if(storage.getItem("info") == null) {
      return null;
    }
    return UserModel.fromJson(storage.getItem("info"));
  }

  LocalStorage openDatabase() {
    return LocalStorage("user");
  }
}