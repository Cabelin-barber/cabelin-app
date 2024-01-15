// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExploreController on _ExploreControllerBase, Store {
  late final _$isLoadingMoreAtom =
      Atom(name: '_ExploreControllerBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$currentLocationAtom =
      Atom(name: '_ExploreControllerBase.currentLocation', context: context);

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
      name: '_ExploreControllerBase.isLoadingEstablishment', context: context);

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
      Atom(name: '_ExploreControllerBase.allEstablishments', context: context);

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

  late final _$todayEstablishmentsAtom = Atom(
      name: '_ExploreControllerBase.todayEstablishments', context: context);

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
      AsyncAction('_ExploreControllerBase.getEstablishments', context: context);

  @override
  Future<void> getEstablishments() {
    return _$getEstablishmentsAsyncAction.run(() => super.getEstablishments());
  }

  late final _$loadMoreEstablishmentsAsyncAction = AsyncAction(
      '_ExploreControllerBase.loadMoreEstablishments',
      context: context);

  @override
  Future loadMoreEstablishments() {
    return _$loadMoreEstablishmentsAsyncAction
        .run(() => super.loadMoreEstablishments());
  }

  late final _$_ExploreControllerBaseActionController =
      ActionController(name: '_ExploreControllerBase', context: context);

  @override
  dynamic infiniteScroll() {
    final _$actionInfo = _$_ExploreControllerBaseActionController.startAction(
        name: '_ExploreControllerBase.infiniteScroll');
    try {
      return super.infiniteScroll();
    } finally {
      _$_ExploreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchEstablishmentByName(String? value) {
    final _$actionInfo = _$_ExploreControllerBaseActionController.startAction(
        name: '_ExploreControllerBase.searchEstablishmentByName');
    try {
      return super.searchEstablishmentByName(value);
    } finally {
      _$_ExploreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingMore: ${isLoadingMore},
currentLocation: ${currentLocation},
isLoadingEstablishment: ${isLoadingEstablishment},
allEstablishments: ${allEstablishments},
todayEstablishments: ${todayEstablishments}
    ''';
  }
}
