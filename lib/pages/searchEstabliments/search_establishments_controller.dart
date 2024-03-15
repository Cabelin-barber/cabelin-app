import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
class SearchEstablishmentsController extends GetxController {
  final Dio _api = Api.dio;

  LocationModel? currentLocation;

  int _currentPage = 0;
  final _userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();
  
  bool isLoadingEstablishment = false;
  
  List<EstablishmentModel> allEstablishments = [];
  
  SearchEstablishmentsController() {
    _userLocationStorageRepository.store.record("userLocation").onSnapshot(_userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });
  }

  Future<void> searchEstablishments(String name) async {
    Map<String, String?> params = {
      "city": currentLocation?.city,
      "name": name
    };
    params.removeWhere((_, value) => value == null);

    try {
      allEstablishments.clear();
      isLoadingEstablishment = true;
      var response = await _api.get(
        "/establishments", 
        queryParameters: params
      );
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage = 1;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      isLoadingEstablishment = false;
    }
  }
}