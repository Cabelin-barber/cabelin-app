import 'package:cabelin_v2/localstorage/models/location_model.dart';

class UserLocationChangedEvent {

  LocationModel newLocation;

  UserLocationChangedEvent({
    required this.newLocation
  });
}