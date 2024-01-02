// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PortfolioController on _PortfolioControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PortfolioControllerBase.isLoading', context: context);

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

  late final _$photosAtom =
      Atom(name: '_PortfolioControllerBase.photos', context: context);

  @override
  ObservableList<PictureModel> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<PictureModel> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$getPortfolioPhotosAsyncAction = AsyncAction(
      '_PortfolioControllerBase.getPortfolioPhotos',
      context: context);

  @override
  Future<void> getPortfolioPhotos() {
    return _$getPortfolioPhotosAsyncAction
        .run(() => super.getPortfolioPhotos());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
photos: ${photos}
    ''';
  }
}
