import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'location_controller.g.dart';

class LocationController = _LocationControllerBase with _$LocationController;

abstract class _LocationControllerBase with Store {

  UserStorageRepository userStorageRepository = GetIt.instance<UserStorageRepository>();
  UserLocationStorageRepository userLocationStorageRepository = GetIt.instance<UserLocationStorageRepository>();

  @observable
  LocationModel? currentLocation;

  _LocationControllerBase() {
    currentLocation = userLocationStorageRepository.getUserLocation();
  }

  @action
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
      var current = await Geolocator.getCurrentPosition();
      List<Placemark> places = await placemarkFromCoordinates(current.latitude, current.longitude);
      Placemark locationAddress = places[0];
      await saveLocation(locationAddress, current.latitude, current.longitude);
    }
  }

  @action
  Future<void> saveLocation(Placemark location, double latitude, double longitude) async {
    LocationModel userLocation = LocationModel(
      city: location.subLocality!,
      state: location.administrativeArea!,
      latitude: latitude.toString(),
      longitude: longitude.toString(),
    );
    currentLocation = userLocation;
    await userLocationStorageRepository.saveUserLocation(userLocation);
  }
}
