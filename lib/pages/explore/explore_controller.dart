import 'package:cabelin_v2/events/user_location_changed_event.dart';
import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/main.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
class ExploreController extends GetxController {
  final _api = Api.dio;
  final _userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();
  final nameEstablishmentController = TextEditingController();

  bool isLoadingMore = false;

  LocationModel? currentLocation;

  bool isLoadingEstablishment = false;

  List<EstablishmentModel> allEstablishments = [];

  List<EstablishmentModel> todayEstablishments = [];

  ExploreController() {
    currentLocation = _userLocationStorageRepository.getUserLocation();
    _userLocationStorageRepository.store.record("userLocation").onSnapshot(_userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });

    getEstablishments();

    eventBus.on<UserLocationChangedEvent>().listen((event) {
      getEstablishments();
    });
  }

  Future<void> getEstablishments() async {

    Map<String, String?> params = {
      "city": currentLocation?.city,
      "page": "0",
      "size": "3"
    };

    params.removeWhere((_, value) => value == null);
    allEstablishments.clear();
    try {
      allEstablishments.clear();
      isLoadingEstablishment = true;
      var response = await _api.get(
        "/establishments", 
        queryParameters: params
      );
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      update();
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      isLoadingEstablishment = false;
    }
  }

  Future<void> loadMoreEstablishments(int page) async {
    Map<String, String?> params = {
      "city": currentLocation?.city,
      "page": page.toString(),
      "size": "1"
    };

    params.removeWhere((_, value) => value == null);

    try {
      var response = await _api.get("/establishments", queryParameters: params);
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      update();
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    }
  }

  didSearchEstablishmentByName(String? value) async {
    if(value == null) return;
    nameEstablishmentController.text = value;
    LoadingFullscreen.startLoading();
    allEstablishments.clear();
    Map<String, String?> params = {
      //"city": currentLocation?.city,
      //"page": _currentPage.toString(),
      //"size": "1",
      "name": value
    };

    params.removeWhere((_, value) => value == null);

    try {
      var response = await _api.get("/establishments", queryParameters: params);
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      update();
    } catch (e) {
      print(e);
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      LoadingFullscreen.stopLoading();
    }
  }
}