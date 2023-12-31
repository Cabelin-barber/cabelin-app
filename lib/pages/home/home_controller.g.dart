// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$currentLocationAtom =
      Atom(name: '_HomeControllerBase.currentLocation', context: context);

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
      name: '_HomeControllerBase.isLoadingEstablishment', context: context);

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

  late final _$allEstablishmentsAtom =
      Atom(name: '_HomeControllerBase.allEstablishments', context: context);

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

  late final _$todayEstablishmentsAtom =
      Atom(name: '_HomeControllerBase.todayEstablishments', context: context);

  @override
  ObservableList<EstablishmentModel> get todayEstablishments {
    _$todayEstablishmentsAtom.reportRead();
    return super.todayEstablishments;
  }

  @override
  set todayEstablishments(ObservableList<EstablishmentModel> value) {
    _$todayEstablishmentsAtom.reportWrite(value, super.todayEstablishments, () {
      super.todayEstablishments = value;
    });
  }

  late final _$getEstablishmentsAsyncAction =
      AsyncAction('_HomeControllerBase.getEstablishments', context: context);

  @override
  Future<void> getEstablishments() {
    return _$getEstablishmentsAsyncAction.run(() => super.getEstablishments());
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
isLoadingEstablishment: ${isLoadingEstablishment},
allEstablishments: ${allEstablishments},
todayEstablishments: ${todayEstablishments}
    ''';
  }
}
