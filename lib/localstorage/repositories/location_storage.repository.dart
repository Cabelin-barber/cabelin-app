import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class UserLocationStorageRepository {
  late Database db;
  var store = StoreRef.main();

  Future<LocationModel> saveUserLocation(LocationModel newLocation) async {
    await store.record('userLocation').put(db, newLocation.toJson());
    return newLocation;
  }

  Future updateUserLocation(LocationModel location) async {
    await store.record('userLocation').update(db, location.toJson());
  }

  LocationModel? getUserLocation() {
    Object? locationJSON = store.record("userLocation").getSync(db);
    if(locationJSON == null) {
       return null;
     }
    return LocationModel.fromJson(locationJSON as Map<String, dynamic>);
  }

  Future<void> clearLocation() async {
    await store.record("userLocation").delete(db);
  }

  Future<void> openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = '${appDocumentDir.path}/sample.db';
    DatabaseFactory databaseFactory = databaseFactoryIo;
    db = await databaseFactory.openDatabase(dbPath);
  }
}