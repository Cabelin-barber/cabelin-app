import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class UserStorageRepository {
  late Database db;
  var store = StoreRef.main();

  Future<UserModel> saveUser(UserModel newUser) async {
    await store.record('user').put(db, newUser.toJson());
    return newUser;
  }

  Future updateUser(UserModel user) async {
    await store.record('user').update(db, user.toJson());
  }

  UserModel? getUser() {
    Object? userJSON = store.record("user").getSync(db);
    if(userJSON == null) {
      return null;
    }
    return UserModel.fromJson(userJSON as Map<String, dynamic>);
  }

  Future<void> clearUser() async{
    await store.record("user").delete(db);
  }

  Future<void> openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = '${appDocumentDir.path}/sample.db';
    DatabaseFactory databaseFactory = databaseFactoryIo;
    db = await databaseFactory.openDatabase(dbPath);
  }
}