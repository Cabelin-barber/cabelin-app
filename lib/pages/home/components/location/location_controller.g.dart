// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationController on _LocationControllerBase, Store {
  late final _$currentLocationAtom =
      Atom(name: '_LocationControllerBase.currentLocation', context: context);

  @override
  LocationModel? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(LocationModel? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_LocationControllerBase.getLocation', context: context);

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  late final _$saveLocationAsyncAction =
      AsyncAction('_LocationControllerBase.saveLocation', context: context);

  @override
  Future<void> saveLocation(
      Placemark location, double latitude, double longitude) {
    return _$saveLocationAsyncAction
        .run(() => super.saveLocation(location, latitude, longitude));
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation}
    ''';
  }
}
