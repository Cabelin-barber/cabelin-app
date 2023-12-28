// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationController on _AuthenticationControllerBase, Store {
  late final _$isLoadingSingInGoogleAtom = Atom(
      name: '_AuthenticationControllerBase.isLoadingSingInGoogle',
      context: context);

  @override
  bool get isLoadingSingInGoogle {
    _$isLoadingSingInGoogleAtom.reportRead();
    return super.isLoadingSingInGoogle;
  }

  @override
  set isLoadingSingInGoogle(bool value) {
    _$isLoadingSingInGoogleAtom.reportWrite(value, super.isLoadingSingInGoogle,
        () {
      super.isLoadingSingInGoogle = value;
    });
  }

  late final _$signInWithGoogleAsyncAction = AsyncAction(
      '_AuthenticationControllerBase.signInWithGoogle',
      context: context);

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$_AuthenticationControllerBaseActionController =
      ActionController(name: '_AuthenticationControllerBase', context: context);

  @override
  dynamic saveUser(UserCredential userGoogle) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.saveUser');
    try {
      return super.saveUser(userGoogle);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingSingInGoogle: ${isLoadingSingInGoogle}
    ''';
  }
}
