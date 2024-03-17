import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/notifications/push_notificaitions.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthenticationController extends GetxController {

  PageViewController pageViewController = GetIt.instance<PageViewController>();
  final api = Api.dio;
  final bool _shouldComeBack;

  AuthenticationController({required shouldComeBack}) : _shouldComeBack = shouldComeBack;
  
  bool isLoadingSingInGoogle = false;
  
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

  loginProvisorio() async {
    UserModel user = UserModel(
      id: "2a777126-84ce-493f-964a-d48f6d4de31a",
      name: "Ze Macueba",
      email: "augusto.dev@proton.me",
      //phone: PhoneModel(number: "62982399800"),
      provider: "GOOGLE"
    );
    await UserStorage.save(user);
  }

  Future<void> saveUserGoogle(UserCredential userGoogle) async {
    UserModel user = UserModel(
      id: userGoogle.user!.uid,
      name: userGoogle.user!.displayName!,
      email: userGoogle.user!.email!,
      phone: userGoogle.user!.phoneNumber,
      provider: "GOOGLE"
    );

    // [ TO-DO ]
    // Arrumar isso aki
    //
    var token = await FirebaseMessagingService.getDeviceFirebaseToken();
    // await api.post("/customers", data: {
    //   "name": user.name,
    //   "email": user.email,
    //   "password": "123-123",
    //   "provider": "GOOGLE",
    //   "notificationToken": token,
    //   "phone": {
    //     "number": "+5562982331315",
    //     "isMobile": true
    //   }
    // });
    await UserStorage.save(user);

    _shouldComeBack 
      ? Get.back()
      : pageViewController.pageController.jumpToPage(0);
  }
}