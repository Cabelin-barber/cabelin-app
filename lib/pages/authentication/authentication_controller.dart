import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  UserStorageRepository userStorageRepository = GetIt.instance<UserStorageRepository>();
  PageViewController pageViewController = GetIt.instance<PageViewController>();
  final bool _shouldComeBack;

  _AuthenticationControllerBase({required shouldComeBack}) : _shouldComeBack = shouldComeBack;
  
  @observable
  bool isLoadingSingInGoogle = false;
  
  @action
  Future<void> signInWithGoogle() async {
  isLoadingSingInGoogle = true;
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
    // [TO-DO]
    // - Enviar o usuário via API
    saveUserGoogle(user);
  } catch (e) {
    ScaffoldMessenger.of(GlobalContext.context.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Erro'),
      )
    );
      print(e);
  } finally{
      isLoadingSingInGoogle = false;
    }
  }

  @action
  Future<void> saveUserGoogle(UserCredential userGoogle) async {
    UserModel user = UserModel(
      id: userGoogle.user!.uid,
      name: userGoogle.user!.displayName!,
      email: userGoogle.user!.email!,
      phoneNumber: userGoogle.user?.phoneNumber,
      provider: Provider.google
    );
    await userStorageRepository.saveUser(user);
    _shouldComeBack 
      ? GlobalContext.context.currentContext?.pop() 
      : pageViewController.pageController.jumpToPage(0);
  }
}