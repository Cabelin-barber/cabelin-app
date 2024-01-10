// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_confirmation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingConfirmationController
    on _BookingConfirmationControllerBase, Store {
  late final _$currentTimeSelectedAtom = Atom(
      name: '_BookingConfirmationControllerBase.currentTimeSelected',
      context: context);

  @override
  int? get currentTimeSelected {
    _$currentTimeSelectedAtom.reportRead();
    return super.currentTimeSelected;
  }

  @override
  set currentTimeSelected(int? value) {
    _$currentTimeSelectedAtom.reportWrite(value, super.currentTimeSelected, () {
      super.currentTimeSelected = value;
    });
  }

  late final _$currentSelectedDateAtom = Atom(
      name: '_BookingConfirmationControllerBase.currentSelectedDate',
      context: context);

  @override
  DateTime get currentSelectedDate {
    _$currentSelectedDateAtom.reportRead();
    return super.currentSelectedDate;
  }

  @override
  set currentSelectedDate(DateTime value) {
    _$currentSelectedDateAtom.reportWrite(value, super.currentSelectedDate, () {
      super.currentSelectedDate = value;
    });
  }

  late final _$_BookingConfirmationControllerBaseActionController =
      ActionController(
          name: '_BookingConfirmationControllerBase', context: context);

  @override
  void addNewService(ServiceModel service) {
    final _$actionInfo = _$_BookingConfirmationControllerBaseActionController
        .startAction(name: '_BookingConfirmationControllerBase.addNewService');
    try {
      return super.addNewService(service);
    } finally {
      _$_BookingConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void deleteService(int index) {
    final _$actionInfo = _$_BookingConfirmationControllerBaseActionController
        .startAction(name: '_BookingConfirmationControllerBase.deleteService');
    try {
      return super.deleteService(index);
    } finally {
      _$_BookingConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTimeSelected(int newTime) {
    final _$actionInfo =
        _$_BookingConfirmationControllerBaseActionController.startAction(
            name: '_BookingConfirmationControllerBase.setCurrentTimeSelected');
    try {
      return super.setCurrentTimeSelected(newTime);
    } finally {
      _$_BookingConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(DateTime newDate) {
    final _$actionInfo = _$_BookingConfirmationControllerBaseActionController
        .startAction(name: '_BookingConfirmationControllerBase.changeDate');
    try {
      return super.changeDate(newDate);
    } finally {
      _$_BookingConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTimeSelected: ${currentTimeSelected},
currentSelectedDate: ${currentSelectedDate}
    ''';
  }
}
