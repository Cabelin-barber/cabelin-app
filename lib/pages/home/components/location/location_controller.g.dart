// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationController on _LocationControllerBase, Store {
  late final _$locationAddressAtom =
      Atom(name: '_LocationControllerBase.locationAddress', context: context);

  @override
  Placemark? get locationAddress {
    _$locationAddressAtom.reportRead();
    return super.locationAddress;
  }

  @override
  set locationAddress(Placemark? value) {
    _$locationAddressAtom.reportWrite(value, super.locationAddress, () {
      super.locationAddress = value;
    });
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_LocationControllerBase.getLocation', context: context);

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  @override
  String toString() {
    return '''
locationAddress: ${locationAddress}
    ''';
  }
}
