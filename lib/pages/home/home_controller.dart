import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Api.dio;
  UserLocationStorageRepository userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();

  @observable
  LocationModel? currentLocation;

  @observable
  bool isLoadingEstablishment = false;

  @observable
  ObservableList<EstablishmentModel> allEstablishments = ObservableList<EstablishmentModel>();

  @observable
  ObservableList<EstablishmentModel> todayEstablishments = ObservableList<EstablishmentModel>();

  _HomeControllerBase() {
    currentLocation = userLocationStorageRepository.getUserLocation();
    userLocationStorageRepository.store.record("userLocation").onSnapshot(userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });

    getEstablishments();
  }

  @action
  Future<void> getEstablishments() async {
    isLoadingEstablishment = true;
    isLoadingEstablishment = false;
    Response response = await api.get("/establishments?page=0&size=10");
    allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
  }
}