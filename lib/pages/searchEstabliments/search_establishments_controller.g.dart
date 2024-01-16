// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_establishments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchEstablishmentsController
    on _SearchEstablishmentsControllerBase, Store {
  late final _$currentLocationAtom = Atom(
      name: '_SearchEstablishmentsControllerBase.currentLocation',
      context: context);

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

  late final _$isLoadingEstablishmentAtom = Atom(
      name: '_SearchEstablishmentsControllerBase.isLoadingEstablishment',
      context: context);

  @override
  bool get isLoadingEstablishment {
    _$isLoadingEstablishmentAtom.reportRead();
    return super.isLoadingEstablishment;
  }

  @override
  set isLoadingEstablishment(bool value) {
    _$isLoadingEstablishmentAtom
        .reportWrite(value, super.isLoadingEstablishment, () {
      super.isLoadingEstablishment = value;
    });
  }

  late final _$allEstablishmentsAtom = Atom(
      name: '_SearchEstablishmentsControllerBase.allEstablishments',
      context: context);

  @override
  ObservableList<EstablishmentModel> get allEstablishments {
    _$allEstablishmentsAtom.reportRead();
    return super.allEstablishments;
  }

  @override
  set allEstablishments(ObservableList<EstablishmentModel> value) {
    _$allEstablishmentsAtom.reportWrite(value, super.allEstablishments, () {
      super.allEstablishments = value;
    });
  }

  late final _$_getEstablishmentsAsyncAction = AsyncAction(
      '_SearchEstablishmentsControllerBase._getEstablishments',
      context: context);

  @override
  Future<void> _getEstablishments() {
    return _$_getEstablishmentsAsyncAction
        .run(() => super._getEstablishments());
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
isLoadingEstablishment: ${isLoadingEstablishment},
allEstablishments: ${allEstablishments}
    ''';
  }
}
