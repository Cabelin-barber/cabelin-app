import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UserRepository {
  late Future<Isar> db;

  UserRepository() {
    db = openDatabase();
  }

  Future<void> saveUser(UserModel newUser) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.userModels.putSync(newUser));
  }

   Future<UserModel?> getUser() async {
    final isar = await db;
    UserModel? user = await isar.userModels.get(1);
    return user;
  }

  Future<Isar> openDatabase() async {
    if(Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [UserModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}