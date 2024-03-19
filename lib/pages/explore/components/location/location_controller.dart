import 'package:cabelin_v2/events/user_location_changed_event.dart';
import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/main.dart';
import 'package:cabelin_v2/models/search_location_model.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
class LocationController extends GetxController {

  final userLocationStorageRepository = GetIt.instance<UserLocationStorageRepository>();
  final api = Dio();
  final searchLocationTextfieldControler = TextEditingController();
  bool isLoading = false;

  LocationModel? currentLocation;

  List<SearchLocationModel> locationsSearch = [];

  LocationController() {
    currentLocation = userLocationStorageRepository.getUserLocation();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(GlobalContext.context.currentContext!).showSnackBar(
        const SnackBar(
          content: TextWidget("Serviço de localização não disponivel")
        )
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(GlobalContext.context.currentContext!).showSnackBar(
          const SnackBar(
            content: TextWidget("Permissoes denied")
          )
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      var current = await Geolocator.getCurrentPosition().catchError((e) {
        print(e);
      });
      List<Placemark> places = await placemarkFromCoordinates(current.latitude, current.longitude);
      Placemark locationAddress = places[0];
      await saveLocation(
        city: locationAddress.subAdministrativeArea!,
        state: locationAddress.administrativeArea!,
        latitude: current.latitude,
        longitude: current.longitude,
        //locationAddress.subAdministrativeArea!, current.latitude, current.longitude
      );
    }
  }

  Future<void> saveLocation({
    required String city,
    required String state,
    required double latitude,
    required double longitude
  }) async {
    LocationModel userLocation = LocationModel(
      city: city,
      state: state,
      latitude: latitude.toString(),
      longitude: longitude.toString(),
    );
    currentLocation = userLocation;
    await userLocationStorageRepository.saveUserLocation(userLocation);
    _closeAndTriggerEvent(currentLocation!);
  }

  _closeAndTriggerEvent(LocationModel newLocation) {
    Get.back();
    eventBus.fire(
      UserLocationChangedEvent(newLocation: newLocation)
    );
  }

  Future<void> searchLocation(String? place) async  {
    isLoading = true;
    update();
    locationsSearch.clear();
    try {
      var result = await api.get("https://maps.googleapis.com/maps/api/place/autocomplete/json", queryParameters: {
        //[TO-DO usar variavel de ambiente]
        "key": "AIzaSyDY1x7sSRBjeTlRoDXJN_ZXj8Q39cFDqFc", 
        "input": place,
        "type": "geocode",
        "language": "pt_BR",
        "components": "country:br"
      });
      locationsSearch.addAll(List.from(result.data['predictions'].map((model) => SearchLocationModel.fromJson({
          "fullAdress": model["description"],
          "formattedAdress": model["structured_formatting"]["secondary_text"]
          }
        )
      )));
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      FeedbackSnackbar.error("Ocorreu um erro ao pesquisar, tente novamente");
      update();
    }
  }

  Future<void> setLocationSearch(SearchLocationModel locationModel) async {
    LoadingFullscreen.startLoading();
    try {
      List<Location> locations = await locationFromAddress(locationModel.fullAdress);
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;
      List<Placemark> places= await placemarkFromCoordinates(latitude, longitude);
      await saveLocation(
        city: places[0].subAdministrativeArea!,
        state: places[0].administrativeArea!,
        latitude: latitude,
        longitude: longitude
      );
    } catch (e) {
      //[ TODO ]
      //COLOCAR PRA MOSTRAR ERRO
    } finally {
      LoadingFullscreen.stopLoading();
    }
  }
}
