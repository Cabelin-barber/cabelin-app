import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  UserLocationStorageRepository userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();

  @observable
  LocationModel? currentLocation;

  _HomeControllerBase() {
    currentLocation = userLocationStorageRepository.getUserLocation();
    userLocationStorageRepository.store.record("userLocation").onSnapshot(userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });
  }
}