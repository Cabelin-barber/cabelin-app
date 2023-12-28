import 'package:cabelin_v2/localstorage/models/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UserRepository {
  late Future<Isar> db;

  UserRepository() {
    db = openDatabase();
  }

  Future<void> saveUser(User newUser) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.users.putSync(newUser));
  }

   Future<User?> getUser() async {
    final isar = await db;
    User? user = await isar.users.get(1);
    return user;
  }

  Future<Isar> openDatabase() async {
    if(Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [UserSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}