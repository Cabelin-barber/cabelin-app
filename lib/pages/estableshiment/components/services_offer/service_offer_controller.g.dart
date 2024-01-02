// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_offer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceOfferController on _ServiceOfferControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ServiceOfferControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$servicesAtom =
      Atom(name: '_ServiceOfferControllerBase.services', context: context);

  @override
  ObservableList<ServiceModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<ServiceModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$getServicesAsyncAction =
      AsyncAction('_ServiceOfferControllerBase.getServices', context: context);

  @override
  Future<void> getServices() {
    return _$getServicesAsyncAction.run(() => super.getServices());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
services: ${services}
    ''';
  }
}
