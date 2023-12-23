// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageview_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageViewController on _PageViewControllerBase, Store {
  late final _$_currentIndexAtom =
      Atom(name: '_PageViewControllerBase._currentIndex', context: context);

  @override
  int get _currentIndex {
    _$_currentIndexAtom.reportRead();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.reportWrite(value, super._currentIndex, () {
      super._currentIndex = value;
    });
  }

  late final _$_PageViewControllerBaseActionController =
      ActionController(name: '_PageViewControllerBase', context: context);

  @override
  dynamic handleChangePage(int index) {
    final _$actionInfo = _$_PageViewControllerBaseActionController.startAction(
        name: '_PageViewControllerBase.handleChangePage');
    try {
      return super.handleChangePage(index);
    } finally {
      _$_PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic handleChangePageByNavigation(int index) {
    final _$actionInfo = _$_PageViewControllerBaseActionController.startAction(
        name: '_PageViewControllerBase.handleChangePageByNavigation');
    try {
      return super.handleChangePageByNavigation(index);
    } finally {
      _$_PageViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
