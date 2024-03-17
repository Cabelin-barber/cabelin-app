import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/main.dart';
class UserStorage {
  
  static UserModel? get() {
    var json = boxStorage.read("userStorage");
    if(json != null) {
      return UserModel.fromJson(json);
    }
    return null;
  }

  static Future<void> save(UserModel establishment) async {
    await boxStorage.write("userStorage", establishment.toJson());
  }

  static Future<void> remove() async {
    await boxStorage.remove("userStorage");
  }
}