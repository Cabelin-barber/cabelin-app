import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
part 'location_controller.g.dart';

class LocationController = _LocationControllerBase with _$LocationController;

abstract class _LocationControllerBase with Store {

  @observable
  Placemark? locationAddress; 

  @action
  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      var current = await Geolocator.getCurrentPosition();
      List<Placemark> places = await placemarkFromCoordinates(current.latitude, current.longitude);
      locationAddress = places[0];
      print(locationAddress);
    }
  }
}
