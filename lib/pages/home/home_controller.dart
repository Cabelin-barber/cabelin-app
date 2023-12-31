import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
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
    await Future.delayed(const Duration(milliseconds: 2500));

    todayEstablishments.addAll([
      EstablishmentModel(
        id: "1",
        name: "Barbearia do seu Zé",
        urlImage: "URL IMAGE",
        location: LocationModel(
          city: "Goiânia",
          state: "Goiás",
          latitude: "123",
          longitude: "321"
        )
      ),
         EstablishmentModel(
        id: "2",
        name: "Café da Esquina",
        urlImage: "URL IMAGE",
        location: LocationModel(
          city: "São Paulo",
          state: "São Paulo",
          latitude: "-23.5505",
          longitude: "-46.6333"
        )
    ),
      EstablishmentModel(
          id: "3",
          name: "Boutique de Vinhos",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Rio de Janeiro",
            state: "Rio de Janeiro",
            latitude: "-22.9083",
            longitude: "-43.1964"
          )
      ),
      EstablishmentModel(
          id: "4",
          name: "Gym Fitness",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Brasília",
            state: "Distrito Federal",
            latitude: "-15.7801",
            longitude: "-47.9292"
          )
      ),
      EstablishmentModel(
          id: "5",
          name: "Pizzaria Bella Italia",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Curitiba",
            state: "Paraná",
            latitude: "-25.4296",
            longitude: "-49.2676"
          )
      ),
    ]);

    allEstablishments.addAll([
      EstablishmentModel(
        id: "1",
        name: "Barbearia do seu Zé",
        urlImage: "URL IMAGE",
        location: LocationModel(
          city: "Goiânia",
          state: "Goiás",
          latitude: "123",
          longitude: "321"
        )
      ),
         EstablishmentModel(
        id: "2",
        name: "Café da Esquina",
        urlImage: "URL IMAGE",
        location: LocationModel(
          city: "São Paulo",
          state: "São Paulo",
          latitude: "-23.5505",
          longitude: "-46.6333"
        )
    ),
      EstablishmentModel(
          id: "3",
          name: "Boutique de Vinhos",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Rio de Janeiro",
            state: "Rio de Janeiro",
            latitude: "-22.9083",
            longitude: "-43.1964"
          )
      ),
      EstablishmentModel(
          id: "4",
          name: "Gym Fitness",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Brasília",
            state: "Distrito Federal",
            latitude: "-15.7801",
            longitude: "-47.9292"
          )
      ),
      EstablishmentModel(
          id: "5",
          name: "Pizzaria Bella Italia",
          urlImage: "URL IMAGE",
          location: LocationModel(
            city: "Curitiba",
            state: "Paraná",
            latitude: "-25.4296",
            longitude: "-49.2676"
          )
      ),
    ]);
    isLoadingEstablishment = false;
    // Response response = await api.get("/establishments?page=0&size=1");
    // var test = List<EstablishmentModel>.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model)));
  }
}