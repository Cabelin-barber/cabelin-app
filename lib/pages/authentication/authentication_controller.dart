import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_repository.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  UserRepository userStorageRepository = GetIt.instance<UserRepository>();
  PageViewController pageViewController = GetIt.instance<PageViewController>();
  
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
    pageViewController.pageController.jumpToPage(0);
  }
}